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
	@echo $(thishost)
ifeq ($(thishost),neth)
	ln -sfT $(dotfiles)xinitrc_neth $(base).xinitrc
endif
ifeq ($(thishost),dore)
	ln -sfT $(dotfiles)xinitrc_dore $(base).xinitrc
endif
	ln -sfT $(dotfiles)config/Thunar $(base).config/Thunar
	ln -sfT $(dotfiles)config/nvim $(base).config/nvim

install-root:
	ln -sf $(dotfiles)bashrc_root /root/.bashrc

root:
	su -c 'make install-root'
