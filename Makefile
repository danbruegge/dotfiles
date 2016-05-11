user=dan
base=/home/$(user)/
df=$(base).dotfiles/
thishost=$(shell hostname)

dead-symlinks:
	find -L $(SEARCHPATH) -type l

install:
	ln -sfT $(df)bash_profile $(base).bash_profile
	ln -sfT $(df)bashrc $(base).bashrc
	ln -sfT $(df)eslintrc $(base).eslintrc
	ln -sfT $(df)jshintrc $(base).jshintrc
	ln -sfT $(df)pip $(base).pip
	ln -sfT $(df)gitconfig $(base).gitconfig
	ln -sfT $(df)screenlayout $(base).screenlayout
	ln -sfT $(df)ssh $(base).ssh
	ln -sfT $(df)tmux.conf $(base).tmux.conf
	ln -sfT $(df)tern-project $(base).tern-project
	ln -sfT $(df)Xresources $(base).Xresources
	ln -sfT $(df)xinitrc_$(thishost) $(base).xinitrc
	ln -sfT $(df)config/Thunar $(base).config/Thunar
	ln -sfT $(df)config/nvim $(base).config/nvim
	ln -sfT $(df)config/ranger $(base).config/ranger
	ln -sfT $(df)makepkg.conf $(base).makepkg.conf
	ln -sfT $(df)Xmodmap $(base).Xmodmap
	ln -sfT $(df)ackrc $(base).ackrc
	ln -sf $(df)git_hooks $(df).git/hooks
	SEARCHPATH=~/ make dead-symlinks

install-root:
	ln -sfT $(df)config/nvim /root/.config/nvim
	ln -sfT $(df)config/ranger /root/.config/ranger
	ln -sfT $(df)bashrc_root /root/.bashrc
	SEARCHPATH=/root/ make dead-symlinks

root:
	su -c 'make install-root'
