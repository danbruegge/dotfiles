user=dan
base=/home/$(user)/
dotfiles=$(base).dotfiles/

install:
	ln -sfT $(dotfiles)bash_profile $(base).bash_profile
	ln -sfT $(dotfiles)bashrc $(base).bashrc
	ln -sfT $(dotfiles)eslintrc $(base).eslintrc
	ln -sfT $(dotfiles)jshintrc $(base).jshintrc
	ln -sfT $(dotfiles)pip $(base).pip
	ln -sfT $(dotfiles)gitconfig $(base).gitconfig
	ln -sfT $(dotfiles)screenlayout $(base).screenlayout
	ln -sfT $(dotfiles)ssh $(base).ssh
	ln -sfT $(dotfiles)xinitrc $(base).xinitrc
	ln -sfT $(dotfiles)config/Thunar $(base).config/Thunar
	ln -sfT $(dotfiles)config/nvim $(base).config/nvim

install-root:
	ln -sf $(dotfiles)bashrc_root /root/.bashrc

root:
	su -c 'make install-root'
