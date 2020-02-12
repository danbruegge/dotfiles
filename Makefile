user=dan
base=/home/$(user)/
df=$(base).dotfiles/
thishost=$(shell hostname)

clean-dead-symlinks:
	find -L $(SEARCHPATH) -type l -exec rm -vi {} \;

show-dead-symlinks:
	find -L $(SEARCHPATH) -type l

install:
	ln -sfT $(df)Xmodmap $(base).Xmodmap
	ln -sfT $(df)Xresources $(base).Xresources
	ln -sfT $(df)ackrc $(base).ackrc
	ln -sfT $(df)bash_profile $(base).bash_profile
	ln -sfT $(df)bashrc $(base).bashrc
	ln -sfT $(df)config/Thunar $(base).config/Thunar
	ln -sfT $(df)config/nvim $(base).config/nvim
	ln -sfT $(df)config/ranger $(base).config/ranger
	ln -sfT $(df)config/tig $(base).config/tig
	ln -sfT $(df)eslintrc $(base).eslintrc
	ln -sfT $(df)gitconfig $(base).gitconfig
	ln -sfT $(df)makepkg.conf $(base).makepkg.conf
	ln -sfT $(df)tern-project $(base).tern-project
	ln -sfT $(df)tmux $(base).tmux
	ln -sfT $(df)tmux.conf $(base).tmux.conf
	ln -sfT $(df)xinitrc_$(thishost) $(base).xinitrc
	ln -sfT ~/Cloud/Documents/ssh-config $(base).ssh
	ln -sfT ~/Cloud/Documents/passwordstore $(base).password-store
	SEARCHPATH=~/ make show-dead-symlinks
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-root:
	ln -sfT $(df)config/nvim /root/.config/nvim
	ln -sfT $(df)config/ranger /root/.config/ranger
	ln -sfT $(df)bashrc_root /root/.bashrc
	SEARCHPATH=/root/ make show-dead-symlinks

root:
	su -c 'make install-root'

tmux-colors:
	chmod +x ./tmux/show-colors.sh
	./tmux/show-colors.sh
