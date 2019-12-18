# .bash_profile

################################################################################
# Load BASH Configuration Files
################################################################################
# Directory structure = $HOME/profile.d & $HOME/profile.d/clients

shopt -s expand_aliases

if [ -d $HOME/profile.d ]; then
  for i in $HOME/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi


################################################################################
# Load Client BASH Configuration Files
################################################################################
# Client Environments (After Other Profiles Loaded)
function load_client_config (){
	if [ -f "$HOME/profile.d/clients/$1.sh" ]; then
		  source "$HOME/profile.d/clients/$1.sh"
	fi
}

declare -a client_configs=(
	"home"
	"utb"
	"bonusbits"
)

# Load Each BASH Config in client_configs List
for i in "${client_configs[@]}"
do
   #echo "INFO: Loading .bash_$i"
   load_client_config $i
done


################################################################################
# Prompt Settings
################################################################################
PS1='\[\033[1;31m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h \[\033[1;32m\]$PWD:\n# \[\033[0m\]'

clear
uname -n -r -m
