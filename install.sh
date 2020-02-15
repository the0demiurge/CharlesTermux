#!/data/data/com.termux/files/usr/bin/bash

apt update
apt install -y git fish curl apt-transport-https gawk tmux vim-python python cowsay sl fortune
pip install ipython powerline-status
clear

if [ -d "$HOME/.termux" ]; then
 mv $HOME/.termux $HOME/.termux.bak
fi

# Setting sources
mkdir -p $HOME/../usr/etc/apt/sources.list.d/
TUNA=$HOME/../usr/etc/apt/sources.list.d/tuna.list
touch $TUNA
echo '# The termux repository mirror from TUNA:'|tee $TUNA
echo 'deb [arch=all,arm] http://mirrors.tuna.tsinghua.edu.cn/termux stable main'|tee -a $TUNA


git clone https://github.com/the0demiurge/CharlesTermux.git $HOME/.local/share/CharlesTermux

cp -r ~/.local/share/CharlesTermux/data/.termux ~

cd ~/.local/share/CharlesTermux/charles/installation.d/conf.d

./config-bash
./config-fish
./config-git
./config-powerline-ipython
./config-tmux

echo 'After installation, you can edit $CHARLES_BACKUP/termux.list and run `inst (inst) in fish shell to install listed packages automitacally.`'
echo 'After installed oh-my-fish, you can run `omf-backup` to backup omf list recorded in $CHARLES_BACKUP/omf.list and run `omf-restore` to restore.'
read

termux-setup-storage
curl -L https://its-pointless.github.io/setup-pointless-repo.sh | sh
curl -L https://get.oh-my.fish | fish

echo Done!

exit
