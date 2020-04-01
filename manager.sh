#!/usr/bin/env bash

############################################
#### Automating Kubectl Contexts        ####
############################################

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
  cat <<EOF

Interactively change the current context.

Usage:
  ctx [-l]

Examples:

  # Interactively change the current context
  kubectl ctx

  # List all contexts (indicating current context with a '*')
  kubectl ctx -l


Flags:
  -l          List all available contexts
  -h, --help  Show this help message


EOF
}

# =============================================================================

function welcome(){
  date_info=$(date +"%Y-%m-%d %T")
  date_info_short=$(date +"%A %B")
  user=$(whoami)
  echo -e "\n"
  echo "Kubectl Plugin" | figlet
  echo -e "\n"
  echo -e "-------------------------------------------------"
  echo "* Welcome ${user}! It's now ${date_info_short}"
  echo -e "* ${date_info}"
  echo -e "*"
  echo -e "*"
  echo -e "* Current Context is $(kubectl config current-context 2>/dev/null)"
  echo -e "* Total of Contexts is $(kubectl config get-contexts | sed -e '1d' | wc -l)"
  echo -e "-------------------------------------------------\n"
}

# =============================================================================

function getContexts() {
  kubectl config get-contexts
}

# =============================================================================

function setContext() {
  local context=$(getContexts | fzf | awk {' print $1 '})
  if [[ -z "${context}" ]]; then
    echo "Aborted. Nothing has been changed."
  else
    kubectl config use-context "${context}"
  fi
}

# =============================================================================
# MAIN
# =============================================================================

type fzf 2> /dev/null || { missingFZF; exit 1; }
type kubectl 2> /dev/null || { missingKubectl; exit 1; }
type figlet 2> /dev/null || { missingFiglet; exit 1; }

welcome

if [[ -z "$1" ]]; then
  setContext
elif [[ "$1" = -l ]]; then
  getContexts
else
  help
fi
