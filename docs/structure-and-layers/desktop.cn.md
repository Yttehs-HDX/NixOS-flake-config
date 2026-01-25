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

> 桌面层是最复杂的一个层级。
> 因为桌面层分为用户层实现和系统层实现，分别被用户层和系统层调用。
> 再加上桌面层需要处理主题与样式，尤为复杂。

## 构成
桌面层分为系统层和用户层，系统层由 nixos.nix 模块统一管理，
用户层由 home.nix 模块统一管理。

### dm
dm 模块维护着一系列可用的 display manager 集合，由主机 profile 决定，
其中 sddm 使用 [`mkDisplayManager`](../desktop/dm/_lib/mkDisplayManager.nix) 函数，
通过 [`getProfile.getHostProfile`](../_lib/getProfile.nix#L11) 函数得到当前主机的
`desktop.dm.some-dm` 配置选项，决定知否实现该 dm。

### aux
aux 维护着一系列桌面环境辅助软件包，由用户 profile 决定。
使用 [`mkAuxPackage`](../desktop/aux/_lib/mkAuxPackage.nix) 函数，
aux 需要用户层和系统层一起完成，
所以通过 [`getProfile.getUserProfile`](../_lib/getProfile.nix#L4) 函数
得到当前用户配置的 `desktop.aux.some-package`，
与 [`getProfile.getHostIntegratedProfile`](../_lib/getProfile.nix#L18) 函数
得到当前主机选择的所有用户配置的 `desktop.aux.some-package`，
home 模块根据单个用户配置生成辅助软件包的 home-manager 配置，
nixos 模块只要检测到存在一个及以上用户使用了辅助软件包，就生成相应的 nixosSystem 配置。

### sessions
sessions 模块维护着一系列可用的桌面会话集合，由用户 profile 决定。
使用 [`mkSession`](../desktop/sessions/_lib/mkSession.nix) 函数，
sessions 也需要用户层和系统层一起完成，
所以通过 [`getProfile.getUserProfile`](../_lib/getProfile.nix#L4) 函数
得到当前用户配置的 `desktop.sessions.some-session`，
与 [`getProfile.getHostIntegratedProfile`](../_lib/getProfile.nix#L18) 函数
得到当前主机选择的所有用户配置的 `desktop.sessions.some-session`，
home 模块根据单个用户配置生成桌面会话的 home-manager 配置，
nixos 模块只要检测到存在一个及以上用户使用了某个桌面会话，就生成相应的 nixosSystem 配置。

#### some-session/aux
这里的 aux 维护着当前桌面会话必要的辅助软件包，跟随 `mkSession` 函数开关控制，
通过直接导入辅助软件包的 home.nix 或 nixos.nix，绕过 `mkAuxPackage` 检查，
在 `desktop.some-session.enable` 为 `true` 时直接激活配置。

### styles
由于存在用户与主机两个特权级，并且主机与用户是一对多的关系，
所以主机与用户需要各自维护自己的主题与样式配置。
比如，display manager 完全由主机层决定，那么主题也由主机决定；
每个用户的桌面会话互相独立，所以主题由用户自身决定。

#### fonts
fonts 模块只在用户层有效。  
通过读取用户 profile 中的 `desktop.style.fonts.some-font`，
控制一种字体在 home-manager 层面的配置。

##### user-fonts
user-fonts 控制用户自定义的字体，将用户 profile 中的 `desktop.style.fonts.default` 与
 `desktop.style.fonts.mono.default` 作为默认值注入。

#### themes
主题配置存在特殊的 config 注入，即根据 accent 生成相应的 palette 配置。  
因为读取 config 后直接对其进行注入会导致**循环依赖**，
所以样式的配置将导出到运行时的 `config.profile.style` 中，并且在用户与主机的视角不同。  
`config.profile.style` 由 [`nixos-inject.nix`](../desktop/styles/nixos-inject.nix) 或
 [`home-inject.nix`](../desktop/styles/home-inject.nix) 从
 `profile.hosts.*.desktop.style` 或 `profile.users.*.desktop.style` 注入得到，
主题模块再在 `config.profile.style.theme` 上派生 `palette` 等运行态值。

### options.nix
所有 `options.nix` 与 `runtime-options.nix` 文件统一属于 options 系统，请参阅[TODO]()。

### home.nix
desktop 的 home-manager 层本质上是一个 nix 模块函数，由 `home.nix` 决定。  
home.nix 最终被用户层调用，作为其一部分生成 home-manager 配置。

### nixos.nix
desktop 的 nixosSystem 层本质上是一个 nix 模块函数，由 `nixos.nix` 决定。  
nixos.nix 最终被系统层调用，作为其一部分生成 nixosSystem 配置。
