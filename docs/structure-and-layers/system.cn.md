# 系统层
```plaintext
system
├── default.nix
├── global
│   ├── default.nix
│   ├── home-manager.nix
│   ├── options.nix
│   ├── users.nix
│   └── some-package.nix
├── home-aux
│   ├── some-package
│   │   ├── default.nix
│   │   └── inner.nix
│   └── default.nix
├── options.nix
└── software
    ├── some-package
    │   ├── default.nix
    │   └── inner.nix
    ├── default.nix
    └── options.nix
```

> 系统层远比用户层复杂的多。
> 因为不仅要处理 nixosSystem 层级，还要处理 home-manager 层级。

## 构成
### software
software 作为系统层的一个子模块，负责维护 nixosSystem 层级的软件包，
通过 [`mkSystemSoftwarePackage.nix`](../system/software/_lib/mkSystemSoftwareModule.nix)，
读取主机的 system.software.some-package 选项，
决定是否为该主机生成这个软件包的配置。

所有软件包的配置统一由 `default.nix` 模块汇总，传递给上层。

### global
global 作为系统层的一个子模块，负责维护 nixosSystem 层级的公共配置，
即每个主机内部都会使用的重复的配置，比如 nix flake 实验性设置。

---
下面对特殊的公共模块进行说明。

#### users.nix
users.nix 负责 nixosSystem 层面的用户创建，
通过调用 [`getProfile.getHostIntegratedProfile`](../_lib/getProfile.nix#L18) 函数，
得到该主机配置 `host.users` 中所有用户的 profile 集合，并遍历生成用户。

#### home-manager.nix
home-manager.nix 负责 home-manager 模块在 nixosSystem 层级的配置，
通过调用 [`getProfile.getHostIntegratedProfile`](../_lib/getProfile.nix#L18) 函数，
得到该主机配置 `host.users` 中所有用户的 profile 集合，
遍历生成 `home-manager.users` 配置项。

这个文件内还发生了重要的 profile 注入用户层的 config 的行为，这将在 [Config 注入](../special-scope/config-injection.cn.md)中详细说明。

---
global 目录内所有配置统一由 `default.nix` 模块汇总，传递给上层。

### home-aux
home-aux 是用户层辅助模块，对于一些软件包，如果只给予用户的权限等级，
无法满足这些软件包的正常工作条件，因此需要系统层提供系统等级的权限。

home-aux 中的只能存在软件包的声明形式，
通过调用 [`getProfile.getHostIntegratedProfile`](../_lib/getProfile.nix#L4) 函数，
得到该主机下所有用户的 profile，
读取用户 profile 中 `home.software.some-package` 选项，
再调用 [`mkHomeAuxModule`](../_lib/getProfile.nix) 判断任意一个用户是否启用了该软件包，
最终生成软件包在系统层的配置。

所有软件包的配置统一由 `default.nix` 模块汇总，传递给上层。

### options.nix
所有 `options.nix` 文件统一属于 options 系统，请参阅[Options 系统](../special-scope/options-system.cn.md)。

### default.nix
system 本质上是一个 nix 模块函数，由 `default.nix` 决定。  
形参为 `hostname` 和 `profiles`，`hostname` 表示主机名。
`profiles` 变量比较特殊，请参阅[Config 注入](../special-scope/config-injection.cn.md)，此处不做讨论。
调用目录内的一切配置，加上桌面层的系统部分，形成 nixosSystem 配置，
返回值为该主机的所有 nixosSystem 配置。
