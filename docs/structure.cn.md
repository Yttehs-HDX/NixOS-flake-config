# 项目结构
本项目由 6 层结构组成。

```plaintext
.
├── desktop     # 桌面层
├── flake.nix   # Flake 层
├── home        # 用户层
├── hosts       # 主机配置
├── system      # 系统层
└── users       # 用户配置
```

---

现在将层级由大到小排列。

### Flake 层
Flake 层是顶层，作为配置树的顶端，维护着所有配置的入口。

### 系统层
系统层负责生成单个 host 的 nixosSystem 配置。

### 用户层
用户层负责生成单个 user 的 home-manager 配置。

### 桌面层
桌面层同时被系统层和用户层使用，辅助生成相应的配置。

---

接下来的两个层级没有大小。

### 主机配置
纯配置，用于声明所有主机的配置。

### 用户配置
纯配置，用于声明所有用户的配置。

---

## 依赖图

```plaintext
flake  -> system
system -> hosts, users, desktop, home
home   -> users, desktop
desktop-> hosts, users
hosts  -> (leaf)
users  -> (leaf)
```
