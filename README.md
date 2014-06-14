for root bashrc
===============
* add symlink from /home/dan/.dotfiles/.bashrc to /root/.bashrc as #root user
* reload shell

for Thunar
----------

ln -s /home/dan/.dotfiles/.config/Thunar/ /home/dan/.config/Thunar
for pip
-------
ln -s /home/dan/.dotfiles/.pip/ /home/dan/.pip

for jshintrc
-----------
ln -s /home/dan/.dotfiles/.jshintrc /home/dan/.jshintrc

for autostart stuff
-------------------
ln -s /home/dan/.dotfiles/.config/autostart/dropbox.desktop /home/dan/.config/autostart/dropbox.desktop
ln -s /home/dan/.dotfiles/.config/autostart/Keepassx.desktop /home/dan/.config/autostart/Keepassx.desktop

remove .ssh/known_hosts from git
--------------------------------
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch .ssh/known_hosts' --prune-empty --tag-name-filter cat -- --all
