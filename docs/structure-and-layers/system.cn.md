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

> 系统层远比用户层复杂得多。
> 因为既要处理 nixosSystem 层级，也要处理 Home Manager 层级。

## 构成
### software
software 子模块负责维护 nixosSystem 层级的软件包，
通过 [`mkSystemSoftwareModule.nix`](../../system/software/_lib/mkSystemSoftwareModule.nix)，
读取主机的 system.software.some-package 选项，
决定是否为该主机构建该软件包的配置。

所有软件包的配置由 `default.nix` 汇总并传递给上层。

### global
global 子模块维护 nixosSystem 层级的公共配置，
即各主机共享的设置，例如 Nix Flake 实验性开关。

---
下面说明几个关键的公共模块。

#### users.nix
users.nix 负责 nixosSystem 层面的用户创建，
通过调用 [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18) 函数，
获取该主机 `host.users` 列表对应的用户 profiles，并据此生成用户。

#### home-manager.nix
home-manager.nix 负责 Home Manager 模块在 nixosSystem 层级的配置，
通过调用 [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18) 函数，
得到该主机配置 `host.users` 中所有用户的 profile 集合，
据此生成 `home-manager.users` 配置项。

该文件还负责将 profiles 注入到用户层配置，详见 [配置注入](../special-scope/config-injection.cn.md)。

---
global 目录内所有配置由 `default.nix` 汇总，传递给上层。

### home-aux
home-aux 是用户层的系统级辅助模块。部分软件包仅凭用户权限无法正常工作，
需要系统层提供权限或服务支持。

home-aux 只包含软件包声明，
通过调用 [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18) 函数
获取该主机下所有用户的 profiles，
读取用户 profile 中 `home.software.some-package` 的开关，
再调用 [`mkHomeAuxModule`](../../system/home-aux/_lib/mkHomeAuxModule.nix) 判断是否有任意用户启用该软件包，
最终生成该软件包在系统层的配置。

所有软件包的配置由 `default.nix` 汇总，传递给上层。

### options.nix
所有 `options.nix` 文件统一属于 Options 系统，请参阅 [Options 系统](../special-scope/options-system.cn.md)。

### default.nix
system 本质上是一个 Nix 模块函数，由 `default.nix` 提供。  
形参为 `hostname` 与 `profiles`，其中 `hostname` 表示主机名，
`profiles` 的含义见 [配置注入](../special-scope/config-injection.cn.md)。
函数会组合目录内的配置与桌面层的系统部分，生成该主机的 nixosSystem 配置。
