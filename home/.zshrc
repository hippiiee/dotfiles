# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias myip="curl http://ipecho.net/plain; echo"
alias dc="docker compose"
alias cfu-clean-url='f(){ cfu-clean $@ | cut -d"|" -f4- ;  unset -f f; }; f'
alias cfu-clean='f(){ cfu $@ | cut -d "|" -f1,3- | awk -F/ "!_[\$1]++" | sort -u -t: -k1,1 ;  unset -f f; }; f'
alias cfu='f(){ jq -r ".results[] | [(.status|tostring), (.length|tostring), (.lines|tostring), (.words|tostring), .url] | join(\"|\")" $@ | sort -uV;  unset -f f; }; f'
alias fu='ffuf -mc all -t 40 -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"'
