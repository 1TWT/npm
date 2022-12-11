## git用法

```
ssh -t git@gitee.com // 查看公钥

```

| `git add`    | 添加文件到暂存区                         |
| ------------ | ---------------------------------------- |
| `git status` | 查看仓库当前的状态，显示有变更的文件。   |
| `git branch` | 查看分支                                 |
| `git diff`   | 比较文件的不同，即暂存区和工作区的差异。 |
| `git commit` | 提交暂存区到本地仓库。                   |
| `git reset`  | 回退版本。                               |
| `git rm`     | 将文件从暂存区和工作区中删除。           |
| `git mv`     | 移动或重命名工作区文件。                 |

## 创建分支 tabbar

```bash
git checkout -b tabbar
```

## 2.5 分支的提交与合并

1. 将本地的 tabbar 分支进行本地的 commit 提交：

```bash
git add .
git commit -m "完成了 tabBar 的开发"
```

2.将本地的 tabbar 分支推送到远程仓库进行保存：

```bash
git push -u origin tabbar
```

3.将本地的 tabbar 分支合并到本地的 master 分支：

```bash
git checkout master //切换到master上
git merge tabbar  //合并tabbar
```

4.删除本地的 tabbar 分支：

```bash
git branch -d tabbar
```