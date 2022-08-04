include ./Makefile.config

clean-dead-symlinks:
	find -L $(SEARCHPATH) -type l -exec rm -vi {} \;

show-dead-symlinks:
	find -L $(SEARCHPATH) -type l

install:
	ln -sfT $(DOTS)ackrc $(BASE).ackrc
	ln -sfT $(DOTS)bash_profile $(BASE).bash_profile
	ln -sfT $(DOTS)bashrc $(BASE).bashrc
	ln -sfT $(DOTS)config/nvim $(BASE).config/nvim
	ln -sfT $(DOTS)config/ranger $(BASE).config/ranger
	ln -sfT $(DOTS)config/tig $(BASE).config/tig
	ln -sfT $(DOTS)config/alacritty $(BASE).config/alacritty
	ln -sfT $(DOTS)config/fontconfig $(BASE).config/fontconfig
	ln -sfT $(DOTS)config/bat $(BASE).config/bat
	ln -sfT $(DOTS)gitconfig $(BASE).gitconfig
	ln -sfT $(DOTS)scripts/gitignore_global $(BASE).gitignore
	ln -sfT $(DOTS)tern-project $(BASE).tern-project
	ln -sfT $(DOTS)gitmux.conf $(BASE).gitmux.conf
	ln -sfT $(DOTS)tmux $(BASE).tmux
	ln -sfT $(DOTS)tmux.conf $(BASE).tmux.conf
	ln -sfT $(CLOUD_PATH)Documents/ssh-config $(BASE).ssh
	ln -sfT $(CLOUD_PATH)Documents/passwordstore $(BASE).password-store
	SEARCHPATH=$(BASE) make show-dead-symlinks
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-linux:
	make install
	ln -sfT $(DOTS)Xmodmap $(BASE).Xmodmap
	ln -sfT $(DOTS)xinitrc_$(THISHOST) $(BASE).xinitrc
	ln -sfT $(DOTS)config/Thunar $(BASE).config/Thunar
	ln -sfT $(DOTS)makepkg.conf $(BASE).makepkg.conf

install-mac:
	make install

install-root:
	ln -sfT $(DOTS)config/nvim /root/.config/nvim
	ln -sfT $(DOTS)config/ranger /root/.config/ranger
	ln -sfT $(DOTS)bashrc_root /root/.bashrc
	SEARCHPATH=/root/ make show-dead-symlinks

root:
	su -c 'make install-root'

tmux-colors:
	chmod +x ./tmux/show-colors.sh
	./tmux/show-colors.sh
