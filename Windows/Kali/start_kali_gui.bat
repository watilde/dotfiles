start /B x410.exe /desktop
kali.exe run "if [ -z \"$(pidof xfce4-session)\" ]; then export DISPLAY=127.0.0.1:0.0; xfce4-session; pkill '(gpg|ssh)-agent'; fi;"