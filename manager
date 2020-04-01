#!/usr/bin/env bash

############################################
#### Automating Kubectl Contexts        ####
############################################

os=`uname`

if [ "${os}" = "Linux" ]
then
    date_cmd="date"
else
    date_cmd="gdate"
fi

# =============================================================================
# VALUES
# =============================================================================

date_info=$(${date_cmd} +"%Y-%m-%d %T")
date_info_short=$(${date_cmd} +"%A %B")
user=$(whoami)
CMD=$1

# =============================================================================
# OUTPUT-COLORING
# =============================================================================

# High Intensity
BLACK='\033[0;90m'       # Black
RED='\033[0;91m'         # Red
GREEN='\033[0;92m'       # Green
YELLOW='\033[0;93m'      # Yellow
BLUE='\033[0;94m'        # Blue
PURPLE='\033[0;95m'      # Purple
CYAN='\033[0;96m'        # Cyan
NC='\033[0;97m'          # White

# =============================================================================
# FUNCTIONS
# =============================================================================

function missingFZF() {
  cat <<EOF

Você precisar instalar o fzf para utilizar esse plugin:

    Github: https://github.com/junegunn/fzf


Install:


====================================================
= Homebrew (macOS) and Linuxbrew (Linux)
====================================================

    brew install fzf


====================================================
= From source (macOS, Linux)
====================================================

    git clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install


====================================================
= Other installation options
====================================================

    Github: https://github.com/junegunn/fzf#installation 


EOF
}

# =============================================================================

function missingKubectl(){
  cat <<EOF

Você precisar instalar o kubectl para utilizar esse plugin:

    URL: https://kubernetes.io/docs/tasks/tools/install-kubectl/


EOF
}

# =============================================================================

function missingFiglet(){
  cat <<EOF

Você precisar instalar o figlet para utilizar esse plugin:

    COMMAND: apt-get update && apt-get install figlet


EOF
}

# =============================================================================

function help() {
  local PROGNAME=$(basename $0)
  echo -e "\n${CYAN}Script $PROGNAME: By ${YELLOW}Lucca Pessoa.${NC}"
  cat <<EOF

Interactively change the current context.

Usage:
  manager [-c]
  manager [-l]
  manager [-i]
  manager [-ns]
  manager [-po]
  manager [-h]

Examples:

  # Interactively change the current context
  kubectl manager

  # List all contexts (indicating current context with a '*')
  kubectl manager -l


Flags:
  -c, c, change, --change             Change Kubectl Context
  -l, ls, l, --list                   List all available contexts
  -i, i, info, --info                 Some information about namespaces and pods
  -ns, ns, namespace, --namespace     List all namespaces
  -po, po, pods, --pods               List all pods in all namespaces
  -h, h, help, --help                 Show this help message


EOF
}

# =============================================================================

function welcome(){
  echo -e "\n"
  echo "Kubectl Manager" | figlet
  echo -e "\n-------------------------------------------------"
  echo "* Welcome ${user}! It's now ${date_info_short}"
  echo -e "* ${date_info}"
  echo -e "* System - ${os}"
  echo -e "*"
  echo -e "*"
  echo -e "* Current Context - ${YELLOW}$(kubectl config view -o=jsonpath='{.current-context}' 2>/dev/null)${NC}"
  echo -e "* Total of Contexts - ${YELLOW}$(kubectl config get-contexts 2> /dev/null | sed -e '1d' | wc -l)${NC}"
  echo -e "-------------------------------------------------\n"
}

# =============================================================================

function info(){
  echo -e "\n-------------------------------------------------"
  echo -e "* Total of Namespaces - ${YELLOW}$(kubectl get ns 2> /dev/null | wc -l)${NC}"
  echo -e "* Total of Pods - ${YELLOW}$(kubectl get pods --all-namespaces 2> /dev/null | wc -l)${NC}"
  echo -e "-------------------------------------------------\n"
}

# =============================================================================

function getContexts() {
  kubectl config get-contexts | sed -e "1d"
}

# =============================================================================

function setContext() {
  type fzf 2> /dev/null || { missingFZF; exit 1; }
  local context=$(getContexts | fzf | awk {' print $1 '} | sort -n)
  if [[ -z "${context}" || "${context}" == "*" ]]; then
    echo -e "\n${RED}Aborted. Nothing has been changed.${NC}"
  else
    kubectl config use-context "${context}"
  fi
}

# =============================================================================
# MAIN
# =============================================================================

type kubectl 2> /dev/null || { missingKubectl; exit 1; }
type figlet 2> /dev/null || { missingFiglet; exit 1; }

welcome

# =============================================================================
# OPTIONS
# =============================================================================

if [ -z "$CMD" ]; then
  setContext
else
  case $CMD in
    "c"|"-c"|"change"|"--change")
      setContext
      ;;
    "ls"|"-l"|"l"|"--list")
      getContexts
      ;;
    "info"|"-i"|"i"|"--info")
      info
      ;;
    "ns"|"-ns"|"namespaces"|"--namespaces")
      kubectl get ns
      ;;
    "po"|"-po"|"pods"|"--pods")
      kubectl get po --all-namespaces
      ;;
    "help"|"-h"|"h"|"--help")
      help
      ;;
    *)
      echo -e "Unknown command $CMD"
      help && exit 1 ;;
  esac
fi
