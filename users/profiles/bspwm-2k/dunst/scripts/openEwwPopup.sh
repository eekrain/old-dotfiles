#!/bin/sh
# Toggles eww bar and resizes bspwm padding.

LOCK_FILE="$HOME/.cache/bar.lck"
EWW_BIN="eww"

if [[ ! -f "$LOCK_FILE" ]]; then
  touch "$LOCK_FILE"
  ${EWW_BIN} close bar; sleep 0.4
  bspc config top_padding 0
else
  rm "$LOCK_FILE"
  bspc config top_padding 100
  
  sleep 0.4; ${EWW_BIN} open bar && xdo lower -N eww-bar
fi
			if [ $pid != $$ ]; then
				kill -9 $pid
				KILLED=true
			fi
		done >/dev/null

		if ! $KILLED; then
			sleep 0.5
			${EWW_BIN} update noti=true
			${EWW_BIN} open notification-popup
			canberra-gtk-play -i message
			touch ${LOCK_FILE}
		fi

		# ${EWW_BIN} update has_another_notif=true
		sleep 5
		finish
		unset KILLED
		${EWW_BIN} update has_another_notif=false
	fi
fi
