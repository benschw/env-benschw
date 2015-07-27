if [ "$(whoami)" = "root" ] 
then CARETCOLOR="red"
else CARETCOLOR="white"
fi

host_color=0
local i=1
for val in $(echo $HOST | od -A n -t dC); do
	host_color=$(($host_color + $i * $val))
	i=$((i + 1))
done
host_color=$((1 + $host_color % 7))

return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{${fg[blue]}%}${PWD/#$HOME/~}${reset_color}%B%F{8}❯ %f%b '
#PROMPT="${${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}//\%/%%}/${${pwd:t}//\%/%%}"

RPS1='${return_code} ${(@s:/:)pwd} $(git_prompt_info) %D{%H:%M:%S}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[grey]%}"

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:%{$fg_bold[cyan]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_no_bold[red]%}✗%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_no_bold[green]%}✔%{$reset_color%}"


MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git
