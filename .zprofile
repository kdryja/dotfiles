if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  if [[ "$HOSTNAME" == "workstation" ]]; then
    exec startx
  else
    exec sway
  fi
fi
