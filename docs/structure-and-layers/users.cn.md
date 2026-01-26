# 用户配置
```plaintext
users
├── default.nix
├── registry.nix
└── username
    └── profile.nix
```

## 构成
### username/profile.nix
profile.nix 是用户层面的纯配置，包括 3 项子配置。

#### user
定义用户的基本信息，比如用户名。

#### home
定义用户的个性化配置，比如软件包。
主要涉及 home-manager 层面的配置，也会轻微涉及到 nixosSystem 层面。

#### desktop
定义用户的个性化桌面配置，比如字体、主题、桌面会话。
涉及到 home-manager 与 nixosSystem 两个层面。

### registry.nix
registry.nix 内部主动维护所有的用户定义相对路径集合，
使用辅助函数 [`mkUserRegistryEntry`](../../users/_lib/mkUserRegistryEntry.nix)，
生成由用户名到用户 profile 的 set 集合。

### default.nix
default.nix 直接返回 `registry.nix` 生成的 set 集合，  
因此 `import ./users` 即可拿到用户名到 profile 的映射。
