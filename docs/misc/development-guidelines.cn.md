# 开发规范
本文仅描述“如何添加”，细节请参考对应层级的说明文档。

## 新建用户
1. 在 `users/<name>/profile.nix` 编写 profile，至少包含 `user.username`，
并按需补充 `desktop` 与 `home.software`。
2. 在 `users/registry.nix` 的 `names` 列表里追加 `./<name>`。
3. 在目标主机 `hosts/<host>/profile.nix` 的 `host.users` 中加入该用户名。
4. 如需桌面层，确保用户 profile 中 `desktop.enable = true`，
并开启需要的 `desktop.sessions` / `desktop.aux`。

## 新建主机
1. 新建目录 `hosts/<hostname>`，包含 `profile.nix` 与 `hardware-configuration.nix`。
2. `profile.nix` 中设置 `host.hostname`（与目录名一致）、`host.system`、`host.users`，
并按需配置 `desktop` 与 `system.software`。
3. 在 `hosts/registry.nix` 的 `paths` 列表里追加 `./<hostname>`。
4. Flake 会自动发现新增主机，无需手动改 `flake.nix`。

## 定义新主题
1. 在 `desktop/styles/themes/<name>` 新增主题模块，
参考 `catppuccin` 的结构（`gtk.nix` / `qt.nix` / `options.nix` / `home.nix`）。
2. 在 `desktop/styles/themes/home.nix` 导入新主题模块。
3. 在 `desktop/styles/themes/options.nix` 与
 `desktop/styles/themes/runtime-options.nix` 的 `name` 枚举中加入新主题名。
4. 如需桌面组件主题（SDDM/Waybar/Rofi 等），在对应模块的 `themes/` 目录新增并导入。
5. 在用户或主机 profile 的 `desktop.style.theme.name` 中设置为新主题名。

## 定义新软件包
1. 先判断归属层级：
  - 用户层：`home/software/<name>`（Home Manager）
  - 系统层：`system/software/<name>`（nixos）
  - 桌面辅助：`desktop/aux/<name>`（按需支持 home/nixos）
2. 参考现有包，使用 `mkSoftware` / `mkSystemSoftware` / `mkAux` 生成模块。
3. 把新目录加入对应的聚合文件：`home/software/default.nix`、
`system/software/default.nix`、`desktop/aux/home.nix` 或 `desktop/aux/nixos.nix`。
4. 在 profile 中通过 `home.software.<name>.enable = true` /
`system.software.<name>.enable = true` /
`desktop.aux.<name>.enable = true` 启用。
