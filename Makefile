NO_COLOR=\x1b[0m
GREEN=\x1b[32;01m
RED=\x1b[31;01m
YELL=\x1b[33;01m

SYMLINKS = **/*.symlink

install: symlink

uninstall: unlink

symlink:
	@for link in $(SYMLINKS); do\
		dotfile=~/.`echo $$link | sed 's#.*/\([^/]*\).symlink#\1#'`;\
		[ -f $$dotfile -a ! -h $$dotfile ] && mv $$dotfile $$dotfile.bak && echo "$(YELL)$$dotfile baked up$(NO_COLOR)";\
		ln -fs `pwd`/$$link $$dotfile;\
		echo "$(GREEN)$$link -> $$dotfile$(NO_COLOR)";\
	done;\
	true

unlink:
	@for link in $(SYMLINKS); do\
		dotfile=~/.`echo $$link | sed 's#.*/\([^/]*\).symlink#\1#'`;\
		[ -h $$dotfile ] && rm -f $$dotfile && echo "$(RED)$$dotfile removed$(NO_COLOR)";\
		[ -f $$dotfile.bak ] && mv $$dotfile.bak $$dotfile && echo "$(GREEN)$$dotfile.bak restored$(NO_COLOR)";\
	done;\
	true
