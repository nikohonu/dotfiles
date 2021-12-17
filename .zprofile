if [[ $(hostnamectl hostname) == arch0 ]]
then
    export QT_QPA_PLATFORMTHEME=qt5ct
    export EDITOR=code
fi
if [[ $(hostnamectl hostname) == arch1 ]]
then
    export EDITOR=nvim
    nohup sh -c 'cd project/JMusicBot || exit; java -Dnogui=true -jar JMusicBot-0.3.6.jar' &
fi
path+=/home/nikohonu/.local/bin
path+=/home/nikohonu/scripts
