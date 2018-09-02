# conf
configuration files

## .vimrc
Configuration file for vim to write  python comfortably.

1. Put ".vimrc" into home directory

2. Execute these commands on terminal

    $ mkdir -p ~/.vim/bundle  
    $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

3. Execute this command on Vim

    :NeoBundleInstall

4. Execute thiese commands on terminal

    $ cd ~/.vim/bundle/  
    $ git clone --recursive https://github.com/davidhalter/jedi-vim.git
    
## .Rprofile
Configuration file for Rscript.

1. Put ".Rprofile" into R home directory

    ie) C:\Users\[username]\Documents

    You can find R home directory using R command below:

    > path.expand("~")
