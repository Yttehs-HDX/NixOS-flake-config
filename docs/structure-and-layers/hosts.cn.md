# 主机配置
```plaintext
hosts
├── default.nix
├── registry.nix
└── hostname
    ├── hardware-configuration.nix
    └── profile.nix
```

## 构成
### hostname
homename 目录下存在两种独立的配置文件。

#### profile.nix
profile.nix 是主机层面的纯配置，包括 3 项子配置。

##### host
定义主机的基本信息，比如主机名。

---

以下是特殊配置。

- **host.users**：字符串数组类型，维护若干用户名，表示该主机需要添加的用户。

##### system
定义主机的个性化配置，比如软件包。
只涉及 nixosSystem 层面。

##### desktop
定义主机的个性化桌面配置，比如字体、主题、display manager。
只涉及 nixosSystem 层面。

#### hardware-configuration.nix
hardware-configuarion.nix 记录了主机的硬件资源配置，主要为磁盘分区配置。
这是主机的特异性文件，由硬件的分区推导自动生成，不建议进行大幅度改动。

通过以下命令生成 hardware-configuarion.nix。

```bash
sudo nixos-generate-config              # 在已经安装完成 NixOS 的环境
# 或
sudo nixos-generate-config --root /mnt  # 在安装 NixOS 过程中
```

### registry.nix
registry.nix 内部主动维护所有的主机定义相对路径集合，
使用辅助函数 [`mkHostRegistryEntry`](../hosts/_lib/mkHostRegistryEntry.nix)，
生成由主机名到用主机 profile 与硬件配置的 set 集合，
可通过键 `profile` 和 `hardwareConfig` 分别获取。

### default.nix
default.nix 直接返回 `registry.nix` 生成的 set 集合，  
因此 `import ./hosts` 即可拿到主机名到 `{ profile, hardwareConfig }` 的映射。
