user=dan
base=/home/$(user)/
dotfiles=$(base).dotfiles/
thishost=$(shell hostname)

install:
	ln -sfT $(dotfiles)bash_profile $(base).bash_profile
	ln -sfT $(dotfiles)bashrc $(base).bashrc
	ln -sfT $(dotfiles)eslintrc $(base).eslintrc
	ln -sfT $(dotfiles)jshintrc $(base).jshintrc
	ln -sfT $(dotfiles)pip $(base).pip
	ln -sfT $(dotfiles)gitconfig $(base).gitconfig
	ln -sfT $(dotfiles)screenlayout $(base).screenlayout
	ln -sfT $(dotfiles)ssh $(base).ssh
	ln -sfT $(dotfiles)tmux.conf $(base).tmux.conf
	ln -sfT $(dotfiles)tern-project $(base).tern-project
	ln -sfT $(dotfiles)Xresources $(base).Xresources
	ln -sfT $(dotfiles)xinitrc_$(thishost) $(base).xinitrc
	ln -sfT $(dotfiles)config/Thunar $(base).config/Thunar
	ln -sfT $(dotfiles)config/nvim $(base).config/nvim
	ln -sfT $(dotfiles)config/terminator $(base).config/terminator
	ln -sf $(dotfiles)git_hooks $(dotfiles).git/hooks

install-root:
	ln -sfT $(dotfiles)config/nvim /root/.config/nvim
	ln -sfT $(dotfiles)bashrc_root /root/.bashrc

root:
	su -c 'make install-root'
