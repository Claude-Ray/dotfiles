if [[ "$INSIDE_EMACS" = 'vterm' ]] \
     && [[ -n ${EMACS_VTERM_PATH} ]] \
     && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-zsh.sh ]]; then
	source ${EMACS_VTERM_PATH}/etc/emacs-vterm-zsh.sh
fi
