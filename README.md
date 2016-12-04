# .emacs.d
emacs-config

emacs
安装
1. 在官网下载x86_64版本的zip
    http://ftp.gnu.org/gnu/emacs/windows/
    emacs-25.1-x86_64-w64-mingw32.zip

2. 解压缩到某个路径
   用鼠标点击Options菜单，随便点击一个选项，比如Save Place in Files between sessions，然后点击Save Options。
   先不要担心你会破坏了什么东西，这样做的目的是让emacs自动创建.emacs.d目录以及.emacs文件
   把这个.emacs & .emacs.d全部删掉，换成github上的.emacs.d

3. 将当中的bin的path(比如C:\emacs-25.1-x86_64-w64-mingw32\bin)添加到环境变量PATH中

4. 启动cmd 输入emacs -nw，以终端模式来运行emacs；只输入emacs，以GUI模式来运行

5. 为GUI版的emacs添加快捷方式
    在桌面上新建一个快捷方式（shortcut），位置（location）填入emacs的安装路径
    C:\emacs-25.1-x86_64-w64-mingw32\bin\runemacs.exe --debug-init
    加了flag --debug-init，是为了方便调试（debug）配置文件。不推荐终端模式emacs.exe建立快捷方式，因为会额外启动一个命令行窗口。

git
<1> install git
:for win, and use default option next to end
msysgit(https://github.com/git-for-windows/git/releases)
:run git bash, tips: use cursor to max window & <Ctrl - +/->

:for mac
:使用 Homebrew 方式安装，Git 被安装在 /usr/local/Cellar/git/<version>/ 中，可执行程序自动在 /usr/local/bin 目录下创建符号连接，可以直接在终端程序中访问。
    $ brew install git 
:通过 brew list 命令可以查看安装的开源软件包。
    $ brew list 
:也可以查看某个软件包安装的详细路径和安装内容。
    $ brew list git 

<2> git local usage
:enter repo folder
    $git init 
:check status & untracked files
    $git status 
:diff untracked files
    $git diff 
:diff stage files
    $git diff --cached 
:roll back untracked files
    $git checkout -- . 
:add change to stage
    $git add <file/./-A> 
:commit stage content to repo
    $git commit -m "MESSAGE" 
    $git log //check git commit log
:roll back tracked files to one commit in local repo, untracked files still exist
    $git reset --hard <commit id>
    $git reflog //get tracked files to latest commit in local repo, untracked files still exist
    $git clean -xf //delete all untracked files including .gitignore

<3> add .gitignore in .git folder after git init
    $touch  .gitignore
    $file .gitignore format:
        A：# for comment   
        B：use shell regular expression, such as *.[oa] or *~  
        C：suffix "/" stand for directory 
        D：prefix "!" stand for negation

<4> github usage
:sign up in https://github.com/

:set git for first usage
    $git config --global user.name "<name>"
    $git config --global user.email "<email>"
:or modify .gitconfig file,add <email> & <name> directly
    $ssh-keygen -t rsa -C "<email>"
:copy ~/.ssh/id_rsa.pub content to ssh key to github web "Settings" -> "SSH and GPG keys"
:https://github.com/ -> Settings -> SSH and GPG keys
    $ssh -T git@github.com //check sucess or not

:create repo
    :https://github.com/ -> New repositories(create own repo for version control)

:copy repo address
:https://github.com/ -> repo -> Quick setup -> SSH(choose copy to clipboard)
    $git remote add origin <copy clone address, use SSH format like "git@github.com">
    $git push -u origin master

<5> upload to github
    :after git commit, then run git push cmd
    $git push
    ( may be ? $git push -u origin master )

<6> download from github <NOTE: other device still need step :set git for first usage>
    :clone repo address
    $git clone <ssh address> //do not need git init
    $git clone "git@github.com:napoleon1815/.emacs.d.git"

<FAQ>
error 1:
    "ERROR: Repository not found."
    :Repository url not exist, check in .git/config url need be equal with github repo Clone or download
error 2:
    "error: failed to push some refs to git"
    :no github README.md in local repo
    $git pull --rebase origin master (pull=fetch+merge)
    $git push -u origin master