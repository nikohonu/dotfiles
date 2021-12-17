#!/bin/sh


BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#694B60BF'
TEXT='#39373Bff'
BACKGROUND='D4CCD1BF'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'

i3lock \
-i /tmp/lock.png \
--insidever-color=$BACKGROUND        \
--ringver-color=$VERIFYING           \
\
--insidewrong-color=$BACKGROUND      \
--ringwrong-color=$WRONG             \
\
--inside-color=$BACKGROUND           \
--ring-color=$DEFAULT                \
--line-color=$BLANK                  \
--separator-color=$DEFAULT           \
\
--verif-color=$TEXT                  \
--wrong-color=$TEXT                  \
--time-color=$TEXT                   \
--date-color=$TEXT                   \
--layout-color=$TEXT                 \
--keyhl-color=$WRONG                 \
--bshl-color=$WRONG                  \
\
--screen 1                           \
--blur 5                             \
--clock                              \
--indicator                          \
--time-str="%H:%M:%S"                \
--date-str="%Y-%m-%d"               \
--keylayout 1                        \
