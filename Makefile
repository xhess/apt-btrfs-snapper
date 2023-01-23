PKGNAME ?= apt-btrfs-snapper

.PHONY: install

install:
        @install -Dm644 -t "$(DESTDIR)/etc/apt/apt.conf.d/" 80snapper
        @install -Dm755 -t "$(DESTDIR)/usr/bin/" apt-btrfs-snapper

uninstall:
        rm -f $(DESTDIR)/etc/apt/apt.conf.d/80snapper
        rm -f $(DESTDIR)/usr/bin/apt-btrfs-snapper
