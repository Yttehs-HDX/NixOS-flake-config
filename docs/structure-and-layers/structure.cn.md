# 项目结构
本项目由 6 个层级组成。

```plaintext
.
├── desktop     # 桌面层
├── flake.nix   # Flake 层
├── home        # 用户层
├── hosts       # 主机配置
├── system      # 系统层
└── users       # 用户配置
```

## 构成
以下按自上而下的顺序说明。

### Flake 层
Flake 层是顶层，作为配置树入口，负责聚合并输出所有配置。

### 系统层
系统层负责生成单个主机的 nixosSystem 配置。

### 用户层
用户层负责生成单个用户的 Home Manager 配置。

### 桌面层
桌面层同时被系统层和用户层使用，用于生成桌面相关配置。

---
以下两项为纯配置层。

### 主机配置
纯配置，用于声明所有主机 profile。

### 用户配置
纯配置，用于声明所有用户 profile。

## 依赖图
```plaintext
flake  -> system
system -> hosts, users, desktop, home
home   -> users, desktop
desktop-> hosts, users
hosts  -> (leaf)
users  -> (leaf)
```
