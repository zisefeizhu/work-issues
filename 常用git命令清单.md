# 常用Git命令清单
一般来说，日常使用只要记住下图6个命令，就可以了。但是熟练使用，恐怕要记住60～100个命令。
## 名次解释
![](https://cdn.nlark.com/yuque/0/2020/png/1143489/1604540730904-090c0576-2472-41b8-89e7-1312f823e3a7.png)
 下面是我整理的常用 Git 命令清单。几个专用名词的译名如下: Workspace：工作区 Index / Stage：暂存区 Repository：仓库区（或本地仓库） Remote：远程仓库

## 新建代码库
```
# 在当前目录新建一个Git代码库
$ git init

# 新建一个目录，将其初始化为Git代码库
$ git init [project-name]

# 下载一个项目和它的整个代码历史
$ git clone [url]
```

## 配置
Git的设置文件为.gitconfig，它可以在用户主目录下(全局配置)，也可以在项目目录下(项目配置)
```
# 显示当前的Git配置
$ git config --list

# 编辑Git配置文件
$ git config -e [--global]

# 设置提交代码时的用户信息
$ git config [--global] user.name "[name]"
$ git config [--global] user.email "[email address]"

# 颜色设置
git config --global color.ui true                         # git status等命令自动着色
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global --unset http.proxy                    # remove  proxy configuration on git
```
## 增加/删除文件
```
# 添加指定文件到暂存区
$ git add [file1] [file2] ...

# 添加指定目录到暂存区，包括子目录
$ git add [dir]

# 添加当前目录的所有文件到暂存区
$ git add .

# 添加每个变化前，都会要求确认
# 对于同一个文件的多处变化，可以实现分次提交
$ git add -p

# 删除工作区文件，并且将这次删除放入暂存区
$ git rm [file1] [file2] ...

# 停止追踪指定文件，但该文件会保留在工作区
$ git rm --cached [file]

# 改名文件，并且将这个改名放入暂存区
$ git mv [file-original] [file-renamed]
```
## 代码提交
```
# 提交暂存区到仓库区
$ git commit -m [message]

# 提交暂存区的指定文件到仓库区
$ git commit [file1] [file2] ... -m [message]

# 提交工作区自上次commit之后的变化，直接到仓库区
$ git commit -a

# 提交时显示所有diff信息
$ git commit -v

# 将add和commit合为一步
$ git commit -am 'message'

# 使用一次新的commit，替代上一次提交
# 如果代码没有任何新变化，则用来改写上一次commit的提交信息
$ git commit --amend -m [message]

# 重做上一次commit，并包括指定文件的新变化
$ git commit --amend [file1] [file2] ...
```
## 分支
```
# 列出所有本地分支
$ git branch

# 列出所有远程分支
$ git branch -r

# 列出所有本地分支和远程分支
$ git branch -a

# 新建一个分支，但依然停留在当前分支
$ git branch [branch-name]

# 新建一个分支，并切换到该分支
$ git checkout -b [branch]

# 新建一个分支，指向指定commit
$ git branch [branch] [commit]

# 新建一个分支，与指定的远程分支建立追踪关系
$ git branch --track [branch] [remote-branch]

# 切换到指定分支，并更新工作区
$ git checkout [branch-name]

# 切换到上一个分支
$ git checkout -

# 建立追踪关系，在现有分支与指定的远程分支之间
$ git branch --set-upstream [branch] [remote-branch]

# 合并指定分支到当前分支
$ git merge [branch]

# 选择一个commit，合并进当前分支
$ git cherry-pick [commit]

# 删除分支
$ git branch -d [branch-name]

# 删除远程分支
$ git push origin --delete [branch-name]
$ git branch -dr [remote/branch]

# 检出版本v2.0
$ git checkout v2.0

# 从远程分支develop创建新本地分支devel并检出
$ git checkout -b devel origin/develop

# 检出head版本的README文件（可用于修改错误回退）
git checkout -- README                                    
六. 标签

# 列出所有tag
$ git tag

# 新建一个tag在当前commit
$ git tag [tag]

# 新建一个tag在指定commit
$ git tag [tag] [commit]

# 删除本地tag
$ git tag -d [tag]

# 删除远程tag
$ git push origin :refs/tags/[tagName]

# 查看tag信息
$ git show [tag]

# 提交指定tag
$ git push [remote] [tag]

# 提交所有tag
$ git push [remote] --tags

# 新建一个分支，指向某个tag
$ git checkout -b [branch] [tag]
```
##  查看信息
```
# 显示有变更的文件
$ git status

# 显示当前分支的版本历史
$ git log

# 显示commit历史，以及每次commit发生变更的文件
$ git log --stat

# 搜索提交历史，根据关键词
$ git log -S [keyword]

# 显示某个commit之后的所有变动，每个commit占据一行
$ git log [tag] HEAD --pretty=format:%s

# 显示某个commit之后的所有变动，其"提交说明"必须符合搜索条件
$ git log [tag] HEAD --grep feature

# 显示某个文件的版本历史，包括文件改名
$ git log --follow [file]
$ git whatchanged [file]

# 显示指定文件相关的每一次diff
$ git log -p [file]

# 显示过去5次提交
$ git log -5 --pretty --oneline

# 显示所有提交过的用户，按提交次数排序
$ git shortlog -sn

# 显示指定文件是什么人在什么时间修改过
$ git blame [file]

# 显示暂存区和工作区的差异
$ git diff

# 显示暂存区和上一个commit的差异
$ git diff --cached [file]

# 显示工作区与当前分支最新commit之间的差异
$ git diff HEAD

# 显示两次提交之间的差异
$ git diff [first-branch]...[second-branch]

# 显示今天你写了多少行代码
$ git diff --shortstat "@{0 day ago}"

# 显示某次提交的元数据和内容变化
$ git show [commit]

# 显示某次提交发生变化的文件
$ git show --name-only [commit]

# 显示某次提交时，某个文件的内容
$ git show [commit]:[filename]

# 显示当前分支的最近几次提交
$ git reflog
```
##  远程同步
```
# 下载远程仓库的所有变动
$ git fetch [remote]

# 显示所有远程仓库
$ git remote -v

# 显示某个远程仓库的信息
$ git remote show [remote]

# 增加一个新的远程仓库，并命名
$ git remote add [shortname] [url]

# 取回远程仓库的变化，并与本地分支合并
$ git pull [remote] [branch]

# 上传本地指定分支到远程仓库
$ git push [remote] [branch]

# 强行推送当前分支到远程仓库，即使有冲突
$ git push [remote] --force

# 推送所有分支到远程仓库
$ git push [remote] --all
```
##  撤销
```
# 恢复暂存区的指定文件到工作区
$ git checkout [file]

# 恢复某个commit的指定文件到暂存区和工作区
$ git checkout [commit] [file]

# 恢复暂存区的所有文件到工作区
$ git checkout .

# 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
$ git reset [file]

# 重置暂存区与工作区，与上一次commit保持一致
$ git reset --hard

# 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变
$ git reset [commit]

# 重置当前分支的HEAD为指定commit，同时重置暂存区和工作区，与指定commit一致
$ git reset --hard [commit]

# 重置当前HEAD为指定commit，但保持暂存区和工作区不变
$ git reset --keep [commit]

# 新建一个commit，用来撤销指定commit
# 后者的所有变化都将被前者抵消，并且应用到当前分支
$ git revert [commit]

# 暂时将未提交的变化移除，稍后再移入
$ git stash
$ git stash pop
```
## 其他
```
git init                                                  # 初始化本地git仓库（创建新仓库）
git config --global user.name "xxx"                       # 配置用户名
git config --global user.email "xxx@xxx.com"              # 配置邮件
git config --global color.ui true                         # git status等命令自动着色
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global --unset http.proxy                    # remove  proxy configuration on git
git clone git+ssh://git@192.168.53.168/VT.git             # clone远程仓库
git status                                                # 查看当前版本状态（是否修改）
git add xyz                                               # 添加xyz文件至index
git add .                                                 # 增加当前子目录下所有更改过的文件至index
git commit -m 'xxx'                                       # 提交
git commit --amend -m 'xxx'                               # 合并上一次提交（用于反复修改）
git commit -am 'xxx'                                      # 将add和commit合为一步
git rm xxx                                                # 删除index中的文件
git rm -r *                                               # 递归删除
git log                                                   # 显示提交日志
git log -1                                                # 显示1行日志 -n为n行
git log -5
git log --stat                                            # 显示提交日志及相关变动文件
git log -p -m
git show dfb02e6e4f2f7b573337763e5c0013802e392818         # 显示某个提交的详细内容
git show dfb02                                            # 可只用commitid的前几位
git show HEAD                                             # 显示HEAD提交日志
git show HEAD^                                            # 显示HEAD的父（上一个版本）的提交日志 ^^为上两个版本 ^5为上5个版本
git tag                                                   # 显示已存在的tag
git tag -a v2.0 -m 'xxx'                                  # 增加v2.0的tag
git show v2.0                                             # 显示v2.0的日志及详细内容
git log v2.0                                              # 显示v2.0的日志
git diff                                                  # 显示所有未添加至index的变更
git diff --cached                                         # 显示所有已添加index但还未commit的变更
git diff HEAD^                                            # 比较与上一个版本的差异
git diff HEAD -- ./lib                                    # 比较与HEAD版本lib目录的差异
git diff origin/master..master                            # 比较远程分支master上有本地分支master上没有的
git diff origin/master..master --stat                     # 只显示差异的文件，不显示具体内容
git remote add origin git+ssh://git@192.168.53.168/VT.git # 增加远程定义（用于push/pull/fetch）
git branch                                                # 显示本地分支
git branch --contains 50089                               # 显示包含提交50089的分支
git branch -a                                             # 显示所有分支
git branch -r                                             # 显示所有原创分支
git branch --merged                                       # 显示所有已合并到当前分支的分支
git branch --no-merged                                    # 显示所有未合并到当前分支的分支
git branch -m master master_copy                          # 本地分支改名
git checkout -b master_copy                               # 从当前分支创建新分支master_copy并检出
git checkout -b master master_copy                        # 上面的完整版
git checkout features/performance                         # 检出已存在的features/performance分支
git checkout --track hotfixes/BJVEP933                    # 检出远程分支hotfixes/BJVEP933并创建本地跟踪分支
git checkout v2.0                                         # 检出版本v2.0
git checkout -b devel origin/develop                      # 从远程分支develop创建新本地分支devel并检出
git checkout -- README                                    # 检出head版本的README文件（可用于修改错误回退）
git merge origin/master                                   # 合并远程master分支至当前分支
git cherry-pick ff44785404a8e                             # 合并提交ff44785404a8e的修改
git push origin master                                    # 将当前分支push到远程master分支
git push origin :hotfixes/BJVEP933                        # 删除远程仓库的hotfixes/BJVEP933分支
git push --tags                                           # 把所有tag推送到远程仓库
git fetch                                                 # 获取所有远程分支（不更新本地分支，另需merge）
git fetch --prune                                         # 获取所有原创分支并清除服务器上已删掉的分支
git pull origin master                                    # 获取远程分支master并merge到当前分支
git mv README README2                                     # 重命名文件README为README2
git reset --hard HEAD                                     # 将当前版本重置为HEAD（通常用于merge失败回退）
git rebase
git branch -d hotfixes/BJVEP933                           # 删除分支hotfixes/BJVEP933（本分支修改已合并到其他分支）
git branch -D hotfixes/BJVEP933                           # 强制删除分支hotfixes/BJVEP933
git ls-files                                              # 列出git index包含的文件
git show-branch                                           # 图示当前分支历史
git show-branch --all                                     # 图示所有分支历史
git whatchanged                                           # 显示提交历史对应的文件修改
git revert dfb02e6e4f2f7b573337763e5c0013802e392818       # 撤销提交dfb02e6e4f2f7b573337763e5c0013802e392818
git ls-tree HEAD                                          # 内部命令：显示某个git对象
git rev-parse v2.0                                        # 内部命令：显示某个ref对于的SHA1 HASH
git reflog                                                # 显示所有提交，包括孤立节点
git show HEAD@{5}
git show master@{yesterday}                               # 显示master分支昨天的状态
git log --pretty=format:'%h %s' --graph                   # 图示提交日志
git show HEAD~3
git show -s --pretty=raw 2be7fcb476
git stash                                                 # 暂存当前修改，将所有至为HEAD状态
git stash list                                            # 查看所有暂存
git stash show -p stash@{0}                               # 参考第一次暂存
git stash apply stash@{0}                                 # 应用第一次暂存
git grep "delete from"                                    # 文件中搜索文本“delete from”
git grep -e '#define' --and -e SORT_DIRENT
git gc
git fsck
```
## 生成一个可供发布的压缩包
```
$ git archive
```


## 准备阶段

进入 Git官网下载合适你的安装包，当前我下载到的版本是 2.11.0，本文也将在这个版本上演示效果。![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20knVvicKXn8LRDubLaUE1W6h8vichtDM484G1MnAp4CywOyoQ8kkWGsQg/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)安装好 Git 后，打开命令行工具，进入工作文件夹（为了便于理解我们在系统桌面上演示），创建一个新的demo文件夹。![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20KE3PjA4w7dF0p0Lbvx2IqicWEibgjCH8nPcl9macN4Y0vyRO1ZrvQn5w/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)进入 Github网站 注册一个账号并登录，进入：

```
https://github.com/gafish/gafish.github.com
```

点击 Clone or download ，再点击 Use HTTPS，复制项目地址 ：

```
https://github.com/gafish/gafish.github.com.git 备用。
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K206RicjXicf3rJ1T3rUuvxE0byoddGEyfia7L5v0ad67KIx65TictT74VY5g/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)再回到命令行工具，一切就绪，接下来进入本文的重点。

## 常用操作

所谓实用主义，就是掌握了以下知识就可以玩转 Git，轻松应对90%以上的需求。以下是实用主义型的Git命令列表，先大致看一下

```
git clone
git config
git branch
git checkout
git status
git add
git commit
git push
git pull
git log
git tag
```

接下来，将通过对：https://github.com/gafish/gafish.github.com

仓库进行实例操作，讲解如何使用 Git 拉取代码到提交代码的整个流程。

## git clone

从git服务器拉取代码

```
git clone https://github.com/gafish/gafish.github.com.git
```

代码下载完成后在当前文件夹中会有一个 gafish.github.com 的目录，通过 cd gafish.github.com 命令进入目录。

## git config

配置开发者用户名和邮箱

```
git config user.name gafish
git config user.email gafish@qqqq.com
```

每次代码提交的时候都会生成一条提交记录，其中会包含当前配置的用户名和邮箱。

## git branch

创建、重命名、查看、删除项目分支，通过 Git 做项目开发时，一般都是在开发分支中进行，开发完成后合并分支到主干。

```
git branch daily/0.0.0
```

创建一个名为 daily/0.0.0 的日常开发分支，分支名只要不包括特殊字符即可。

```
git branch -m daily/0.0.0 daily/0.0.1
```

如果觉得之前的分支名不合适，可以为新建的分支重命名，重命名分支名为 daily/0.0.1

## git branch

通过不带参数的branch命令可以查看当前项目分支列表

```
git branch -d daily/0.0.1
```

如果分支已经完成使命则可以通过 -d 参数将分支删除，这里为了继续下一步操作，暂不执行删除操作

## git checkout

切换分支

```
git checkout daily/0.0.1
```

切换到 daily/0.0.1 分支，后续的操作将在这个分支上进行

## git status

查看文件变动状态

通过任何你喜欢的编辑器对项目中的 README.md 文件做一些改动，保存。

## git status

通过 git status 命令可以看到文件当前状态 Changes not staged for commit: （改动文件未提交到暂存区）

```
On branch daily/0.0.1
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
    modified:   README.md
no changes added to commit (use "git add" and/or "git commit -a")
git add
```

添加文件变动到暂存区

```
git add README.md
```

通过指定文件名 README.md 可以将该文件添加到暂存区，如果想添加所有文件可用 git add . 命令，这时候可通过 git status 看到文件当前状态 Changes to be committed: （文件已提交到暂存区）

```
On branch daily/0.0.1
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
    modified:   README.md
```

## git commit

提交文件变动到版本库

```
git commit -m '这里写提交原因'
```

通过 -m 参数可直接在命令行里输入提交描述文本

## git push

将本地的代码改动推送到服务器

```
git push origin daily/0.0.1
```

origin 指代的是当前的git服务器地址，这行命令的意思是把 daily/0.0.1 分支推送到服务器，当看到命令行返回如下字符表示推送成功了。

```
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 267 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local objects.
To https://github.com/gafish/gafish.github.com.git
 * [new branch]      daily/0.0.1 -> daily/0.0.1
```

现在我们回到Github网站的项目首页，点击 Branch:master 下拉按钮，就会看到刚才推送的 daily/00.1分支了

## git pull

将服务器上的最新代码拉取到本地

```
git pull origin daily/0.0.1
```

如果其它项目成员对项目做了改动并推送到服务器，我们需要将最新的改动更新到本地，这里我们来模拟一下这种情况。

进入Github网站的项目首页，再进入 daily/0.0.1 分支，在线对 README.md 文件做一些修改并保存，然后在命令中执行以上命令，它将把刚才在线修改的部分拉取到本地，用编辑器打开 README.md ，你会发现文件已经跟线上的内容同步了。

如果线上代码做了变动，而你本地的代码也有变动，拉取的代码就有可能会跟你本地的改动冲突，一般情况下 Git 会自动处理这种冲突合并，但如果改动的是同一行，那就需要手动来合并代码，编辑文件，保存最新的改动，再通过 git add . 和 git commit -m 'xxx' 来提交合并。

## git log

查看版本提交记录

```
git log
```

通过以上命令，我们可以查看整个项目的版本提交记录，它里面包含了提交人、日期、提交原因等信息，得到的结果如下：

```
commit c334730f8dba5096c54c8ac04fdc2b31ede7107a
Author: gafish <gafish@qqqq.com>
Date:   Wed Jan 11 09:44:13 2017 +0800
    Update README.md
commit ba6e3d21fcb1c87a718d2a73cdd11261eb672b2a
Author: gafish <gafish@qqqq.com>
Date:   Wed Jan 11 09:31:33 2017 +0800
    test
.....
```

提交记录可能会非常多，按 J 键往下翻，按 K 键往上翻，按 Q 键退出查看

## git tag

为项目标记里程碑

```
git tag publish/0.0.1
git push origin publish/0.0.1
```

当我们完成某个功能需求准备发布上线时，应该将此次完整的项目代码做个标记，并将这个标记好的版本发布到线上，这里我们以 publish/0.0.1 为标记名并发布，当看到命令行返回如下内容则表示发布成功了

```
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/gafish/gafish.github.com.git
 * [new tag]         publish/0.0.1 -> publish/0.0.1
.gitignore
```

设置哪些内容不需要推送到服务器，这是一个配置文件

```
touch .gitignore
```

.gitignore 不是 Git 命令，而在项目中的一个文件，通过设置 .gitignore 的内容告诉 Git 哪些文件应该被忽略不需要推送到服务器，通过以上命令可以创建一个 .gitignore 文件，并在编辑器中打开文件，每一行代表一个要忽略的文件或目录，如：

```
demo.html
build/
```

以上内容的意思是 Git 将忽略 demo.html 文件 和 build/ 目录，这些内容不会被推送到服务器上

## 小结

通过掌握以上这些基本命令就可以在项目中开始用起来了，如果追求实用，那关于 Git 的学习就可以到此结束了，偶尔遇到的问题也基本上通过 Google 也能找到答案，如果想深入探索 Git 的高阶功能，那就继续往下看 深入探索 部分。

## 深入探索

- 基本概念

- - 工作区（Working Directory） 就是你在电脑里能看到的目录，比如上文中的 gafish.github.com 文件夹就是一个工作区![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20eNGAyeyuMCygxxnrhErM5VjY63C5vAnuicrKJpQoVh4fFL1LVCeunHw/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)
  - 本地版本库（Local Repository） 工作区有一个隐藏目录 .git，这个不算工作区，而是 Git 的版本库。![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K209yoJfIqRnENfCPA6AZzcibeyPowTvZic7MO7gB2wf9aUGxHA5IKDsOYQ/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)
  - 暂存区（stage） 本地版本库里存了很多东西，其中最重要的就是称为 stage（或者叫index）的暂存区，还有 Git 为我们自动创建的第一个分支 master，以及指向 master 的一个指针叫 HEAD。
  - 远程版本库（Remote Repository） 一般指的是 Git 服务器上所对应的仓库，本文的示例所在的github仓库就是一个远程版本库![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20Bh22zVnERQsac8Jzlm89j42ZG0yXsAGEbGrreRe4DAPiahCWI8ucKAQ/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

以上概念之间的关系:工作区、暂存区、本地版本库、远程版本库之间几个常用的 Git 操作流程如下图所示：![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K207x3VwVmExicAXrBicTM7EuQNLKuaOKJicLlv8VNKn9eWqDL4htzKNVypQ/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

**分支（Branch）**

分支是为了将修改记录的整个流程分开存储，让分开的分支不受其它分支的影响，所以在同一个数据库里可以同时进行多个不同的修改![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20YUxFzG5bO2cusZb1AQ8HNGibZFWAMZTO3H5oS7vadnFlXW421iaLlktw/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

**主分支（Master）**前面提到过 master 是 Git 为我们自动创建的第一个分支，也叫主分支，其它分支开发完成后都要合并到 master![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20kiazO97EzHgSfIDHicYXUqFuOaEPsyicibIlYmNO0C09sG4eaRh64SsBibQ/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)**标签（Tag）**

标签是用于标记特定的点或提交的历史，通常会用来标记发布版本的名称或版本号（如：publish/0.0.1），虽然标签看起来有点像分支，但打上标签的提交是固定的，不能随意的改动，参见上图中的1.0 / 2.0 / 3.0

**HEAD**

HEAD 指向的就是当前分支的最新提交![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20bnzXmCiacGpVpiblGMPbPdstGVQahncbLAOWiczOT77mH5eicF13SxZq7g/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

以上概念了解的差不多，那就可以继续往下看，下面将以具体的操作类型来讲解 Git 的高阶用法

## 操作文件

```
git add
#添加文件到暂存区

git add -i
#通过此命令将打开交互式子命令系统，你将看到如下子命令

***Commands***
  1: status      2: update      3: revert      4: add untracked
  5: patch      6: diff      7: quit      8: help
```

通过输入序列号或首字母可以选择相应的功能，具体的功能解释如下：

```
status：#功能上和 git add -i 相似，没什么鸟用
update：#详见下方 git add -u
revert：#把已经添加到暂存区的文件从暂存区剔除，其操作方式和 update 类似
add untracked：#可以把新增的文件添加到暂存区，其操作方式和 update 类似
patch：#详见下方 git add -p
diff：#比较暂存区文件和本地版本库的差异，其操作方式和 update 类似
quit：#退出 git add -i 命令系统
help：#查看帮助信息
git add -p
```

直接进入交互命令中最有用的 patch 模式

这是交互命令中最有用的模式，其操作方式和 update 类似，选择后 Git 会显示这些文件的当前内容与本地版本库中的差异，然后您可以自己决定是否添加这些修改到暂存区，在命令行 Stage deletion [y,n,q,a,d,/,?]? 后输入 y,n,q,a,d,/,? 其中一项选择操作方式，具体功能解释如下：

- y：接受修改
- n：忽略修改
- q：退出当前命令
- a：添加修改
- d：放弃修改
- /：通过正则表达式匹配修改内容
- ?：查看帮助信息

```
git add -u
```

直接进入交互命令中的 update 模式

它会先列出工作区 修改 或 删除 的文件列表，新增 的文件不会被显示，在命令行 Update>> 后输入相应的列表序列号表示选中该项，回车继续选择，如果已选好，直接回车回到命令主界面

```
git add --ignore-removal .
#添加工作区 修改 或 新增 的文件列表， 删除 的文件不会被添加

git commit
#把暂存区的文件提交到本地版本库

git commit -m '第一行提交原因'  -m '第二行提交原因'
#不打开编辑器，直接在命令行中输入多行提交原因

git commit -am '提交原因'
#将工作区 修改 或 删除 的文件提交到本地版本库， 新增 的文件不会被提交

git commit --amend -m '提交原因'
#修改最新一条提交记录的提交原因

git commit -C HEAD
#将当前文件改动提交到 HEAD 或当前分支的历史ID

git mv
#移动或重命名文件、目录

git mv a.md b.md -f
#将 a.md 重命名为 b.md ，同时添加变动到暂存区，加 -f 参数可以强制重命名，相比用 mv a.md b.md 命令省去了 git add 操作

git rm
#从工作区和暂存区移除文件

git rm b.md
#从工作区和暂存区移除文件 b.md ，同时添加变动到暂存区，相比用 rm b.md 命令省去了 git add 操作

git rm src/ -r
#允许从工作区和暂存区移除目录

git status

git status -s
#以简短方式查看工作区和暂存区文件状态，示例如下：
 M demo.html
?? test.html

git status --ignored
#查看工作区和暂存区文件状态，包括被忽略的文件
```

## 操作分支

```
git branch
#查看、创建、删除分支

git branch -a
#查看本地版本库和远程版本库上的分支列表

git branch -r
#查看远程版本库上的分支列表，加上 -d 参数可以删除远程版本库上的分支

git branch -D
#分支未提交到本地版本库前强制删除分支

git branch -vv
#查看带有最后提交id、最近提交原因等信息的本地版本库分支列表
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K2005uGic0PMOflR03Iku94icbUO1y6lwlPGjj6tGYpR9jmv4FrIPZf8iasw/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

```
git merge
#将其它分支合并到当前分支

git merge --squash
#将待合并分支上的 commit 合并成一个新的 commit 放入当前分支，适用于待合并分支的提交记录不需要保留的情况
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K201VTd92gAKY8QmupjNDNI1sWlGFPOTkHtGTjOL7Yon4brWQtwA1cclg/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

```
git merge --no-ff
#默认情况下，Git 执行"快进式合并"（fast-farward merge），会直接将 Master 分支指向 Develop 分支，使用 --no-ff 参数后，会执行正常合并，在 Master 分支上生成一个新节点，保证版本演进更清晰。
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20kiazO97EzHgSfIDHicYXUqFuOaEPsyicibIlYmNO0C09sG4eaRh64SsBibQ/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

```
git merge --no-edit
#在没有冲突的情况下合并，不想手动编辑提交原因，而是用 Git 自动生成的类似 Merge branch 'test'的文字直接提交

git checkout
#切换分支

git checkout -b daily/0.0.1
#创建 daily/0.0.1 分支，同时切换到这个新创建的分支

git checkout HEAD demo.html
#从本地版本库的 HEAD（也可以是提交ID、分支名、Tag名） 历史中检出 demo.html 覆盖当前工作区的文件，如果省略 HEAD 则是从暂存区检出

git checkout --orphan new_branch
#这个命令会创建一个全新的，完全没有历史记录的新分支，但当前源分支上所有的最新文件都还在，真是强迫症患者的福音，但这个新分支必须做一次 git commit 操作后才会真正成为一个新分支。

git checkout -p other_branch
#这个命令主要用来比较两个分支间的差异内容，并提供交互式的界面来选择进一步的操作，这个命令不仅可以比较两个分支间的差异，还可以比较单个文件的差异。

git stash
#在 Git 的栈中保存当前修改或删除的工作进度，当你在一个分支里做某项功能开发时，接到通知把昨天已经测试完没问题的代码发布到线上，但这时你已经在这个分支里加入了其它未提交的代码，这个时候就可以把这些未提交的代码存到栈里。

git stash
#将未提交的文件保存到Git栈中

git stash list
#查看栈中保存的列表

git stash show stash@{0}
#显示栈中其中一条记录

git stash drop stash@{0}
#移除栈中其中一条记录

git stash pop
#从Git栈中检出最新保存的一条记录，并将它从栈中移除

git stash apply stash@{0}
#从Git栈中检出其中一条记录，但不从栈中移除

git stash branch new_banch
#把当前栈中最近一次记录检出并创建一个新分支

git stash clear
#清空栈里的所有记录

git stash create
#为当前修改或删除的文件创建一个自定义的栈并返回一个ID，此时并未真正存储到栈里

git stash store xxxxxx
#将 create 方法里返回的ID放到 store 后面，此时在栈里真正创建了一个记录，但当前修改或删除的文件并未从工作区移除

$ git stash create
09eb9a97ad632d0825be1ece361936d1d0bdb5c7
$ git stash store 09eb9a97ad632d0825be1ece361936d1d0bdb5c7
$ git stash list
stash@{0}: Created via "git stash store".
```

## 操作历史

```
git log
#显示提交历史记录

git log -p
#显示带提交差异对比的历史记录

git log demo.html
#显示 demo.html 文件的历史记录

git log --since="2 weeks ago"
#显示2周前开始到现在的历史记录，其它时间可以类推

git log --before="2 weeks ago"
#显示截止到2周前的历史记录，其它时间可以类推

git log -10
#显示最近10条历史记录

git log f5f630a..HEAD
#显示从提交ID f5f630a 到 HEAD 之间的记录，HEAD 可以为空或其它提交ID

git log --pretty=oneline
#在一行中输出简短的历史记录

git log --pretty=format:"%h" 
#格式化输出历史记录
```

Git 用各种 placeholder 来决定各种显示内容，我挑几个常用的显示如下：

```
%H: #commit hash
%h: #缩短的commit hash
%T: #tree hash
%t: #缩短的 tree hash
%P: #parent hashes
%p: #缩短的 parent hashes
%an: #作者名字
%aN: #mailmap的作者名
%ae: #作者邮箱
%ad: #日期 (--date= 制定的格式)
%ar: #日期, 相对格式(1 day ago)
%cn: #提交者名字
%ce: #提交者 email
%cd: #提交日期 (--date= 制定的格式)
%cr: #提交日期, 相对格式(1 day ago)
%d: #ref名称
%s: #commit信息标题
%b: #commit信息内容
%n: #换行
git cherry-pick
#合并分支的一条或几条提交记录到当前分支末梢

git cherry-pick 170a305
#合并提交ID 170a305 到当前分支末梢

git reset
#将当前的分支重设（reset）到指定的 <commit> 或者 HEAD

git reset --mixed <commit>
#--mixed 是不带参数时的默认参数，它退回到某个版本，保留文件内容，回退提交历史

git reset --soft <commit>
#暂存区和工作区中的内容不作任何改变，仅仅把 HEAD 指向 <commit>

git reset --hard <commit>
#自从 <commit> 以来在工作区中的任何改变都被丢弃，并把 HEAD 指向 <commit>

git rebase
#重新定义分支的版本库状态

git rebase branch_name
#合并分支，这跟 merge 很像，但还是有本质区别，看下图：
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20Ljic4iaVjDy3xGWbRg1uM2LKnI9tTsrbhJDuGhAJZ8VQSqyoUSTf7ryQ/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)合并过程中可能需要先解决冲突，然后执行 git rebase --continue

```
git rebase -i HEAD~~
#打开文本编辑器，将看到从 HEAD 到 HEAD~~ 的提交如下

pick 9a54fd4 添加commit的说明
pick 0d4a808 添加pull的说明
# Rebase 326fc9f..0d4a808 onto d286baa
#
# Commands:
#  p, pick = use commit
#  r, reword = use commit, but edit the commit message
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#  f, fixup = like "squash", but discard this commit's log message
#  x, exec = run command (the rest of the line) using shell
#
```

将第一行的 pick 改成 Commands 中所列出来的命令，然后保存并退出，所对应的修改将会生效。

如果移动提交记录的顺序，将改变历史记录中的排序。

```
git revert
#撤销某次操作，此次操作之前和之后的 commit 和 history 都会保留，并且把这次撤销作为一次最新的提交

git revert HEAD
#撤销前一次提交操作

git revert HEAD --no-edit
#撤销前一次提交操作，并以默认的 Revert "xxx" 为提交原因

git revert -n HEAD
#需要撤销多次操作的时候加 -n 参数，这样不会每次撤销操作都提交，而是等所有撤销都完成后一起提交

git diff
#查看工作区、暂存区、本地版本库之间的文件差异，用一张图来解释
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K201auneMo2JvpM3ZOzg5lIM98EueIeDac79xlKfGNcZJiaGXEcMOXUVow/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

```
git diff --stat
#通过 --stat 参数可以查看变更统计数据

 test.md | 1 -
 1 file changed, 1 deletion(-)
git reflog
#reflog 可以查看所有分支的所有操作记录（包括commit和reset的操作、已经被删除的commit记录，跟 git log 的区别在于它不能查看已经删除了的commit记录
```

![图片](https://mmbiz.qpic.cn/mmbiz_png/tuSaKc6SfPqH7ucazp3z1djgELCB2K20mSvgMFsoniaWzI0MG0qGc4NLOWzlrudXHuibhYB25iaDQvwrULgCVIcpg/640?wx_fmt=png&wxfrom=5&wx_lazy=1&wx_co=1)

## 远程版本库连接

如果在GitHub项目初始化之前，文件已经存在于本地目录中，那可以在本地初始化本地版本库，再将本地版本库跟远程版本库连接起来

```
git init
#在本地目录内部会生成.git文件夹

git remote -v
#不带参数，列出已经存在的远程分支，加上 -v 列出详细信息，在每一个名字后面列出其远程url

git remote add origin https://github.com/gafish/gafish.github.com.git
#添加一个新的远程仓库，指定一个名字，以便引用后面带的URL

git fetch
#将远程版本库的更新取回到本地版本库

git fetch origin daily/0.0.1
#默认情况下，git fetch 取回所有分支的更新。如果只想取回特定分支的更新，可以指定分支名。
```

## 问题排查

```
git blame
#查看文件每行代码块的历史信息

git blame -L 1,10 demo.html
#截取 demo.html 文件1-10行历史信息

git bisect
#二分查找历史记录，排查BUG

git bisect start
#开始二分查找

git bisect bad
#标记当前二分提交ID为有问题的点

git bisect good
#标记当前二分提交ID为没问题的点

git bisect reset
#查到有问题的提交ID后回到原分支
```

## 更多操作

```
git submodule
#通过 Git 子模块可以跟踪外部版本库，它允许在某一版本库中再存储另一版本库，并且能够保持2个版本库完全独立

git submodule add https://github.com/gafish/demo.git demo
#将 demo 仓库添加为子模块

git submodule update demo
#更新子模块 demo

git gc
#运行Git的垃圾回收功能，清理冗余的历史快照

git archive
#将加了tag的某个版本打包提取

git archive -v --format=zip v0.1 > v0.1.zip
#--format 表示打包的格式，如 zip，-v 表示对应的tag名，后面跟的是tag名，如 v0.1。
```

## 总结

本文只是对 Git 的所有功能中的部分实用功能做了一次探秘，Git非常强大，还有很多功能有待我们去发现，限于本文篇幅，咱就此打住吧，预知更多好用功能，请善用谷歌。