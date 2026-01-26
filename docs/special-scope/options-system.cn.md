# Options 系统
profile 注入 `config.profile` 后，需要定义 options.something 定义，
不仅可以使 config 生效，而且可以为配置选项定义类型限制。

为了便于管理，options.nix 文件存放于使用其定义处，统一向上级 options.nix 汇总。

## 用户层
- [`home/software/options.nix`](../../home/software/options.nix)

  定义了用户 profile 中 `home.software.submodule.enable` 选项。
  该文件被 `home/options.nix` 内部引用。

- [`home/options.nix`](../../home/options.nix)

  定义了用户 profile 中 `user.{username,description,isSuper}` 选项。
  该文件被 `system/global/options.nix` 内部引用，相当于软链接。

## 系统层
- [`system/global/options.nix`](../../system/global/options.nix)

  由于 `home-manager.nix` 用到了用户 profile 的 `user` 选项，
  故简单导入 `home/options.nix` 模块。
  该文件被 `system/options.nix` 内部引用。

- [`system/software/options.nix`](../../system/software/options.nix)

  定义了主机 profile 中 `system.software.submodule.enable` 选项。
  该文件被 `system/options.nix` 内部引用。

- [`system/options.nix`](../../system/options.nix)

  定义了主机 profile 中 `host.{hostname,users,system}` 选项。
  该文件最终被 [`system/default.nix`](../../system/default.nix) 的
  `nixosSystem.modules` 使用。

## 桌面层
桌面层不仅需要处理用户与主机 profile 的配置，还要处理自身的 config.profile.style 注入。

- [`desktop/options-home.nix`](../../desktop/options-home.nix)

  定义了用户 profile 中 `desktop.enable` 选项。
  该文件被 `home/options.nix` 内部引用。

- [`desktop/options-nixos.nix`](../../desktop/options-nixos.nix)

  与前者相同，定义了主机 profile 中 `desktop.enable` 选项。
  该文件被 `system/options.nix` 内部引用。

- [`desktop/aux/options.nix`](../../desktop/aux/options.nix)

  定义了用户 profile 中 `desktop.aux.submodule.enable` 选项。
  该文件被 `desktop/options-home.nix` 内部引用。

- [`desktop/dm/options.nix`](../../desktop/dm/options.nix)

  定义了主机 profile 中 `desktop.dm.submodule.enable` 选项。
  该文件被 `desktop/options-nixos.nix` 内部引用。

- [`desktop/sessions/options.nix`](../../desktop/sessions/options.nix)

  定义了用户 profile 中 `desktop.sessions.submodule.enable` 选项。
  该文件被 `desktop/options-home.nix` 内部引用。

- [`desktop/styles/fonts/options.nix`](../../desktop/styles/fonts/options.nix)

  定义了用户和主机 profile 中 `desktop.style.fonts.{default,mono.default}` 与
  `desktop.style.fonts.submodule.enable` 选项。
  该文件被 `desktop/styles/options.nix` 内部引用。

- [`desktop/styles/themes/options.nix`](../../desktop/styles/themes/options.nix)

  定义了用户和主机 profile 中 `desktop.style.theme.submodule.{name,flavor,accent}` 选项。
  该文件被 `desktop/styles/options.nix` 内部引用。

- [`desktop/styles/options.nix`](../../desktop/styles/options.nix)

  简单导入 `desktop/styles/fonts/options.nix` 和 `desktop/styles/themes/options.nix` 模块。
  该文件被 `desktop/options-home.nix` 和 `desktop/options-nixos.nix` 内部引用。

---
桌面层存在特殊的运行时将用户或主机的样式注入 `config.profile.style` 过程。

- [`desktop/styles/fonts/runtime-options.nix`](../../desktop/styles/fonts/runtime-options.nix)

  定义了 `profile.style.fonts.{default,mono.default}` 与
   `profile.style.fonts.submodule.enable` 选项。
  该文件被 `desktop/styles/runtime-options.nix` 内部引用。

- `desktop/styles/themes/some-theme/options.nix`

  定义了 `profile.style.theme.submodule.palette`。
  该文件被 `desktop/styles/themes/runtime-options.nix` 内部引用。

- [`desktop/styles/themes/runtime-options.nix`](../../desktop/styles/themes/runtime-options.nix)

  定义了 `profile.style.theme.submodule.{name,flavor,accent}` 选项。
  该文件被 `desktop/styles/runtime-options.nix` 内部引用。

- [`desktop/styles/runtime-options.nix`](../../desktop/styles/runtime-options.nix)

  简单导入 `desktop/styles/fonts/runtime-options.nix` 和
   `desktop/styles/themes/runtime-options.nix` 模块。
  该文件被 `desktop/styles/{home.nix,nixos.nix}` 内部导入，
  最终汇总于 [`desktop/home.nix`](../../desktop/home.nix) 和
   [`desktop/nixos.nix`](../../desktop/nixos.nix) 中，在外部调用时自动获得。
