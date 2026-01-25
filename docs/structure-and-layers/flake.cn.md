# Flake 层
```plaintext
.
└── flake.nix
```

## 构成
### flake.nix
flake.nix 负责调用系统层，从而维护所有主机的配置。

---
以下是特殊行为。

[`system`](../system/default.nix) 函数需要一个特殊的参数 `profiles`，
表示用户和主机的 profile 集合体，请参阅 [Config 注入](../special-scope/config-injection.cn.md)。
