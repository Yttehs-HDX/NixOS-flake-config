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
software 子模块负责维护 Home Manager 层级的软件包，
通过 [`mkSoftwarePackage.nix`](../../home/software/_lib/mkSoftwarePackage.nix)，
读取用户的 `home.software.some-package` 选项，
决定是否为该用户生成该软件包的配置。

所有软件包的配置由 `default.nix` 汇总，传递给上层。

### global
global 子模块维护 Home Manager 层级的公共配置，
即每个用户都会使用的通用设置，例如 Home Manager 的基础配置。

---
下面对特殊的公共模块进行说明。

#### user.nix
user.nix 定义 Home Manager 内部对用户的基本属性设置，
通过调用 [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4) 函数，
得到该用户的 profile，读取用户 profile 中 `user.username` 配置，
以此设置 Home Manager 中的用户名与用户家目录。

---
global 目录内所有配置由 `default.nix` 汇总，传递给上层。

### options.nix
所有 `options.nix` 文件统一属于 Options 系统，请参阅 [Options 系统](../special-scope/options-system.cn.md)。

### default.nix
home 本质上是一个 Nix 模块函数，由 `default.nix` 提供。  
形参为 `username`（用户名），
函数会组合目录内的配置与桌面层的用户部分，生成该用户的 Home Manager 配置。
