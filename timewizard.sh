#!/bin/bash
# shellcheck source=/dev/null
# Usage timewizard "task name" duration(mins) interval(seconds)

CONFIG_FOLDER="/home/$USER/.config/timewizard"
CONFIG_HISTORY="$CONFIG_FOLDER/history"
CONFIG_TAGS="$CONFIG_FOLDER/tags"
CONFIG_TIMER="$CONFIG_FOLDER/timer"

if [ ! -d "$CONFIG_FOLDER" ]; then
    mkdir $CONFIG_FOLDER
fi
if [ ! -f "$CONFIG_HISTORY" ]; then
    touch $CONFIG_HISTORY
fi
if [ ! -f "$CONFIG_TAGS" ]; then
    touch $CONFIG_TAGS
fi

# Empty initialization just to make shellcheck stop complaining
mins=""
interval=""
task=""

source "${CONFIG_FOLDER}/timewizard.conf"

chooseTag (){
   TAG=$(echo "Add new tag" | cat $CONFIG_TAGS - | gum choose --ordered --selected=45 )
   if [ "$TAG" = "Add new tag" ];then
	   TAG=$(gum input)
	   echo $TAG >> $CONFIG_TAGS
   fi
}

chooseTimer (){
   TIMER=$(echo "Add new timer" | cat $CONFIG_TIMER - | gum choose)
   if [ "$TIMER" = "Add new timer" ];then
	   TIMER=$(gum input)
	   echo $TIMER >> $CONFIG_TIMER
   fi
}

chooseTag
chooseTimer

# Pomodoro time start: notify user
secs=$(( mins * 60 ))
loops=$((secs / interval))
notify-send "${APP_NAME}" "Start: ${task}"

# Progress bar loop
#if [ "${BAR_PROGRESS}" == "yes" ]; then
#    SECONDS=0
#    for ((i=0; i<loops; i++))
#    do
#        duration=$SECONDS;
#        percentage="$(( 100 - 100*(secs - duration) / secs ))";
#
#        bar1_w=$(( percentage * BAR_WIDTH / 100 ));
#        bar2_w=$(( BAR_WIDTH - bar1_w ));
#        bar1_s=$(printf "%${bar1_w}s" | tr " " "|")
#        bar2_s=$(printf "%${bar2_w}s" | tr " " ".")
#        progress="${bar1_s}${bar2_s}"
#
#        time_left_str="$(( (secs - duration) / 60 )):$(( (secs - duration) % 60 ))";
#        percentage_str="${percentage}%"
#        printf "\r%s Time left %s (%s) " "${task}: $progress" "$time_left_str" "$percentage_str"
#
#        # Did time pass?
#        if (( duration > secs )); then
#            printf "\r\033[K%s: Done! \n" "${task}"
#            break;
#        fi
#        sleep "$interval";
#
#        [ "${TICKS}" == "yes" ] && ${PLAYER} "${SOUND_CLICK_FILE}" 2> /dev/null
#    done
#else
#    # Sleep for the time specified
#    sleep "$secs";
#fi

# Time end:
# Play sound
#[ "${SOUND}" == "yes" ] && ${PLAYER} "${SOUND_FILE}" 2> /dev/null
#
#notify-send "${APP_NAME}" "End: ${task}"

# Verify and call the screen locker
#if [[ -n "${locker}" ]]; then
#    if ! command -v ${locker} &> /dev/null
#    then
#        notify-send "${APP_NAME}" "Display locker ${locker} not found"
#    fi
#    sleep 5;
#   ${locker}
#   exit;
#fi
#exit;
