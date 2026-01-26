# 用户层
```plaintext
home
├── default.nix
├── global
│   ├── default.nix
│   ├── home-manager.nix
│   └── some-config.nix
├── options.nix
└── software
    ├── some-package
    │   ├── default.nix
    │   └── inner.nix
    ├── options.nix
    └── default.nix
```

## 构成
### software
software 作为用户层的一个子模块，负责维护 home-manager 层级的软件包，
通过 [`mkSoftwarePackage.nix`](../../home/software/_lib/mkSoftwarePackage.nix)，
读取用户的 `home.software.some-package` 选项，
决定是否为该用户生成这个软件包的配置。

所有软件包的配置统一由 `default.nix` 模块汇总，传递给上层。

### global
global 作为用户层的一个子模块，负责维护 home-manager 层级的公共配置，
即每个用户内部都会使用的重复的配置，比如软件包 home-manager。

---
下面对特殊的公共模块进行说明。

#### user.nix
user.nix 定义了 home-manager 内部对用户的基本属性的设置，
通过调用 [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4) 函数，
得到该用户的 profile，读取用户 profile 中 `user.username` 配置，
以此设置 home-manager 中用户名和用户家目录两项属性，

---
global 目录内所有配置统一由 `default.nix` 模块汇总，传递给上层。

### options.nix
所有 `options.nix` 文件统一属于 options 系统，请参阅 [Options 系统](../special-scope/options-system.cn.md)。

### default.nix
home 本质上是一个 nix 模块函数，由 `default.nix` 决定。  
形参为 `username`，表示用户名，
调用目录内的一切配置，加上桌面层的用户部分，形成 home-manager 配置，
返回值为该用户的所有 home-manager 配置。
