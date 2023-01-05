local br='$(_scm_prompt "%s")'
color_variation=""
hn="$(hostname)"
if [[ $hn == 'mbp-mozilla' ]]
then
color_variation='$FG[001]'
else
color_variation='$FG[002]'
fi

from_ssh=$(pstree -s $$ | grep sshd)

hostname=""
if [[ -n $from_ssh ]]
then
  hostname="$FG[003]$hn"
fi

PROMPT="%{$FG[004]%}%2~%{$color_variation%}::${hostname}%{${reset_color}%}${br}%{$color_variation%}$%{${reset_color}%} "
