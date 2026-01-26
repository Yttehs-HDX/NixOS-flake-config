# 配置注入
用户配置和主机配置都支持按 username 或 hostname 读取 profile，
但各模块并不直接以单个 profile 作为入参，而是通过配置注入统一访问。

## Flake 层
在 Flake 层中，从用户与主机配置收集 profile 键值对，
分别以 `users` 和 `hosts` 作为前缀合并为 `profiles` 变量，
并在调用系统层函数时传入。

## 系统层
系统层初始化阶段尚未注入配置，因此需要手动读取当前主机的 profile，
以获得 `host.system` 等关键字段。

---
由于 nixosSystem 与 Home Manager 的配置彼此独立，因此需要在两个层级分别注入。

### nixosSystem 层的配置注入
lib.nixosSystem 构造 `modules` 时，将 profiles 写入 `config.profile`。

此刻之后，[`getProfile`](../../_lib/getProfile.nix) 函数在 nixosSystem 作用域生效。

### Home Manager 层的配置注入
[`system/global/home-manager`](../../system/global/home-manager.nix) 中，
通过 `getProfile.getHostIntegratedProfile` 获取当前主机启用的用户 profile 集合，
汇总为内部 `profiles` 变量，并在 `home-manager.sharedModules` 中注入 `config.profile`。

此刻之后，[`getProfile`](../../_lib/getProfile.nix) 函数在 Home Manager 作用域生效。

## 桌面层
为处理用户、主机及其组合差异化的样式配置，
桌面层会将调用方的样式注入到运行时的 `config.profile.style`。

---
由于 nixosSystem 与 Home Manager 的配置彼此独立，因此也需要分别注入。
当外部调用 `desktop/home.nix` 或 `desktop/nixos.nix` 时触发注入。

### Home Manager 层的配置注入
[`desktop/styles/home-inject.nix`](../../desktop/styles/home-inject.nix) 中，
利用 `getProfile` 函数得到当前 profile 的 `desktop.style`，
并注入到 `config.profile.style` 中。

此刻之后，[`getStyle`](../../_lib/getStyle.nix) 函数在 Home Manager 作用域生效。

### nixosSystem 层的配置注入
与 Home Manager 层类似，
[`desktop/styles/nixos-inject.nix`](../../desktop/styles/nixos-inject.nix) 中，
利用 `getProfile` 函数得到当前 profile 的 `desktop.style`，
并注入到 `config.profile.style` 中。

此刻之后，[`getStyle`](../../_lib/getStyle.nix) 函数在 nixosSystem 作用域生效。

## 用户层
用户层不直接进行配置注入，用户 profile 的注入在系统层完成。
