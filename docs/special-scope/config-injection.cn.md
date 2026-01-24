# Config 注入
用户配置和主机配置都可以查询特定 username 或 hostname 的 profile 内容，
但是项目中各个模块并不是直接要求传入形参为某一个 profile。

## Flake 层
在 Flake 层中，从用户配置与主机配置得到所有用户与主机的 profile 键值对，
将用户的 profile 提供前缀 `users`，主机的 profile 提供前缀 `hosts`，
再合并为一个 `profiles` 变量。

profiles 变量随后在调用系统层函数时作为参数传入。

## 系统层
系统层初始化初期并没有发生 config 注入，因此需要手动调用主机配置函数，
传入 `hostname` 形参，得到当前主机的 profile，取出 `host.system`。

---
由于 nixosSystem 与 home-manager 的 config 是独立的，因此需要在两个层级都进行注入。

#### nixosSystem 层的 config 注入
直到 lib.nixosSystem 函数构造 modules 时，
才发生 profiles 注入到 `config.profile` 这个过程。

此刻之后，[`getProfile`](../../_lib/getProfile.nix) 函数在 nixosSystem 作用域生效。

#### home-manager 层的 config 注入
[`system/global/home-manager`](../../system/global/home-manager.nix) 中，
通过 `getProfile.getHostIntegratedProfile` 获取当期主机选择的所有用户 profile，
整合到内部 profiles 变量，在 home-manager.sharedModules 内
完成将 profiles 注入到 `config.profile` 的过程。

此刻之后，[`getProfile`](../../_lib/getProfile.nix) 函数在 home-manager 作用域生效。
