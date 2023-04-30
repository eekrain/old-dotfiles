

LOCK_FILE="$HOME/.cache/eww-redshift.lock"

case $1 in
  "color")
    [[ ! -f "$LOCK_FILE" ]] && echo "$bgSecondary" || echo "#1c2325"
  ;;
  "toggle")
    if [[ ! -f "$LOCK_FILE" ]]; then
      touch "$LOCK_FILE"
      redshift -P -l -7.8321757340401605:110.35956370306734
    else
      rm "$LOCK_FILE"
      redshift -x
      pkill redshift
    fi
  ;;
esac
