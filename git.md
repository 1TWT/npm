# git提交

## 1.初始化本地仓库

```
git init
// 查看文件状态
git status
// 将文键加入暂存区
git add .
//本地提交
git commit -m "progect"
//生成公钥
ssh-keygen -t rsa -C “2174323146.com”
//检测公钥是否配置成功
 ssh -T git@github.com
 //关联
 git remote add origin git@github.com:1TWT/npm.git
 //提交
git push -u origin main

```

## 2.分支提交

```

// 创建子分支
git checkout -b tabbar

//查看子分支
git branch
// 查看状态
git status

// 将改变文件加入暂存区
git add .
// 本地提交
git commit -m "分支提交"


// 将本地home分支提交到github
git push -u origin tabbar

```

## 3 合并子分支

```
// 切换到主分支
git checkout main

// 合并
git merge tabbar

// 推送
git push

//删除本地
git branch -d tabbar
```

