# 桌面层
```plaintext
desktop
├── aux
│   ├── some-package
│   │   ├── home.nix
│   │   ├── inner-home.nix
│   │   ├── inner-nixos.nix
│   │   ├── nixos.nix
│   │   └── themes
│   ├── home.nix
│   ├── nixos.nix
│   └── options.nix
├── dm
│   ├── nixos.nix
│   ├── options.nix
│   └── some-dm
│       ├── inner-nixos.nix
│       ├── nixos.nix
│       └── themes
├── home.nix
├── nixos.nix
├── options-home.nix
├── options-nixos.nix
├── sessions
│   ├── home.nix
│   ├── some-session
│   │   ├── aux
│   │   ├── home.nix
│   │   ├── inner-home
│   │   ├── inner-nixos.nix
│   │   └── nixos.nix
│   ├── nixos.nix
│   └── options.nix
└── styles
    ├── fonts
    │   ├── home.nix
    │   ├── some-font
    │   │   ├── default.nix
    │   │   └── inner-home.nix
    │   ├── options.nix
    │   ├── runtime-options.nix
    │   └── user-fonts
    ├── home-inject.nix
    ├── home.nix
    ├── nixos-inject.nix
    ├── nixos.nix
    ├── options.nix
    ├── runtime-options.nix
    └── themes
        ├── some-theme
        │   ├── default.nix
        │   ├── gtk.nix
        │   ├── inner
        │   │   └── palettes.nix
        │   └── qt.nix
        ├── home.nix
        ├── options.nix
        └── runtime-options.nix
```

> 桌面层是最复杂的层级：
> 同时包含用户层实现与系统层实现，并且需要处理主题与样式。

## 构成
桌面层分为系统层与用户层：系统层由 nixos.nix 统一管理，
用户层由 home.nix 统一管理。

### dm
dm 模块维护可用的 display manager 集合，由主机 profile 决定，
其中 sddm 使用 [`mkDisplayManager`](../../desktop/dm/_lib/mkDisplayManager.nix) 函数，
通过 [`getProfile.getHostProfile`](../../_lib/getProfile.nix#L11) 函数得到当前主机的
`desktop.dm.some-dm` 配置选项，并结合 `desktop.enable` 决定是否实现该 dm。

### aux
aux 维护桌面环境的辅助软件包，由用户 profile 决定。
使用 [`mkAuxPackage`](../../desktop/aux/_lib/mkAuxPackage.nix) 函数，
aux 需要用户层和系统层共同完成：
通过 [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4) 获取当前用户的
`desktop.aux.some-package`，
并通过 [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18) 获取
当前主机选择的所有用户的 `desktop.aux.some-package`。
home 模块根据单个用户配置生成辅助软件包的 Home Manager 配置；
nixos 模块只要检测到存在一个及以上用户启用该组件（需同时满足 `desktop.enable` 与
`desktop.aux.some-package.enable`），就生成相应的 nixosSystem 配置。

### sessions
sessions 模块维护可用的桌面会话集合，由用户 profile 决定。
使用 [`mkSession`](../../desktop/sessions/_lib/mkSession.nix) 函数，
sessions 也需要用户层与系统层共同完成：
通过 [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4) 获取当前用户的
`desktop.sessions.some-session`，
并通过 [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18) 获取
当前主机选择的所有用户的 `desktop.sessions.some-session`。
home 模块根据单个用户配置生成桌面会话的 Home Manager 配置；
nixos 模块只要检测到存在一个及以上用户启用该会话（需同时满足 `desktop.enable` 与
`desktop.sessions.some-session.enable`），就生成相应的 nixosSystem 配置。

#### some-session/aux
这里的 aux 维护当前桌面会话必要的辅助软件包，随 `mkSession` 开关控制，
通过直接导入辅助软件包的 home.nix 或 nixos.nix，绕过 `mkAuxPackage` 检查，
在 `desktop.sessions.some-session.enable` 为 `true` 时直接激活配置。

### styles
由于存在用户与主机两个特权级，且主机与用户是一对多关系，
主机与用户需要分别维护自己的主题与样式配置。
例如 display manager 完全由主机层决定，其主题也随主机决定；
每个用户的桌面会话互相独立，因此主题由用户自身决定。

#### fonts
fonts 模块只在用户层有效。  
通过读取用户 profile 中的 `desktop.style.fonts.some-font`，
控制一种字体在 Home Manager 层面的配置。

##### user-fonts
user-fonts 控制用户自定义字体，将用户 profile 中的
`desktop.style.fonts.default` 与 `desktop.style.fonts.mono.default` 注入为默认值。

#### themes
主题配置存在特殊的配置注入：根据 accent 生成相应的 palette 配置。  
由于读取配置后再写回会导致**循环依赖**，
样式配置会导出到运行时的 `config.profile.style`，且用户与主机视角不同。  
`config.profile.style` 由 [`nixos-inject.nix`](../../desktop/styles/nixos-inject.nix) 或
 [`home-inject.nix`](../../desktop/styles/home-inject.nix) 从
 `profile.hosts.*.desktop.style` 或 `profile.users.*.desktop.style` 注入得到，
主题模块再在 `config.profile.style.theme` 上派生 `palette` 等运行态值。

### options.nix
所有 `options.nix` 与 `runtime-options.nix` 文件统一属于 Options 系统，请参阅 [Options 系统](../special-scope/options-system.cn.md)。

### home.nix
desktop 的 Home Manager 层本质上是一个 Nix 模块函数，由 `home.nix` 提供。  
home.nix 最终被用户层调用，作为其一部分生成 Home Manager 配置。

### nixos.nix
desktop 的 nixosSystem 层本质上是一个 Nix 模块函数，由 `nixos.nix` 提供。  
nixos.nix 最终被系统层调用，作为其一部分生成 nixosSystem 配置。
