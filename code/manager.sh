# ==============================================================================
## DESCRIPTION: Automating Kubectl Contexts Management.
## NAME: install
## AUTHOR: Lucca Pessoa da Silva Matos
## DATE: 12.04.2020
## VERSION: 1.0
# ==============================================================================

# ==============================================================================
# OUTPUT-COLORING
# ==============================================================================

# High Intensity
BLACK='\033[0;90m'       # Black
RED='\033[0;91m'         # Red
GREEN='\033[0;92m'       # Green
YELLOW='\033[0;93m'      # Yellow
BLUE='\033[0;94m'        # Blue
PURPLE='\033[0;95m'      # Purple
CYAN='\033[0;96m'        # Cyan
NC='\033[0;97m'          # White

# ==============================================================================
# VALUES
# ==============================================================================

OS=`uname`
[ "${OS}" = "Linux" ] && DATE_CMD="date" || DATE_CMD="gdate"
DATE_INFO=$(${DATE_CMD} +"%Y-%m-%d %T")
DATE_INFO_SHORT=$(${DATE_CMD} +"%A %B")
USER=$(whoami)
CMD=$1

# =============================================================================
# FUNCTIONS
# =============================================================================

function MissingFZF() {
  cat <<EOF

Você precisar instalar o FZF para utilizar esse plugin:

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

function MissingKubectl(){
  cat <<EOF

You need to install kubectl to use this plugin:

    URL: https://kubernetes.io/docs/tasks/tools/install-kubectl/


EOF
}

# =============================================================================

function MissingFiglet(){
  cat <<EOF

You need to install figlet to use this plugin:

    COMMAND: apt-get update && apt-get install figlet


EOF
}

# =============================================================================

function Help() {
  local PROGNAME=$(basename $0)
  echo -e "\n${CYAN}Script $PROGNAME: By ${YELLOW}Lucca Pessoa.${NC}"
  cat <<EOF

Interactively change the current context.

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

function Welcome(){
  echo -e "\n"
  echo "Kubectl Manager" | figlet
  echo -e "\n-------------------------------------------------"
  echo "* Welcome ${USER}! It's now ${DATE_INFO_SHORT}"
  echo -e "* ${DATE_INFO}"
  echo -e "* System - ${OS}"
  echo -e "*"
  echo -e "* Autor: ${YELLOW}Lucca Pessoa da Silva Matos${YELLOW}${NC}"
  echo -e "* Description: ${BLUE}Kubectl Contexts Managemen${BLUE}${NC}"
  echo -e "-------------------------------------------------\n"
}

# =============================================================================

function Info(){
  echo -e "\n-------------------------------------------------"
  echo -e "* Cluster Info:"
  echo -e "*"
  echo -e "* Total Namespaces - ${YELLOW}$(kubectl get ns 2> /dev/null | wc -l)${NC}"
  echo -e "* Total Pods - ${YELLOW}$(kubectl get pods --all-namespaces 2> /dev/null | wc -l)${NC}"
  echo -e "*"
  echo -e "* Pods Status:"
  echo -e "*"
  echo -e "* Running - ${YELLOW}$(kubectl get pods --all-namespaces --field-selector=status.phase=Running 2> /dev/null | wc -l)${NC}"
  echo -e "* Not Running - ${YELLOW}$(kubectl get pods --all-namespaces --field-selector=status.phase!=Running,status.phase=Failed 2> /dev/null | wc -l)${NC}"
  echo -e "*"
  echo -e "* If you want more information, run: manager -ns describe"
  echo -e "-------------------------------------------------\n"
}

# =============================================================================

function DescribrePodsEachNamespace(){
  echo -e "\n${YELLOW}List total pods by namespace:${NC}\n"
  for NAMESPACE in $(kubectl get ns 2> /dev/null | sed -e "1d" | awk {' print $1 '}); do
    PODS=$(kubectl get pods -n ${NAMESPACE}  2> /dev/null | wc -l)
    if [ ${PODS} -eq 0 ]; then continue; fi
    echo -e "${YELLOW}Namespace${NC} ${NAMESPACE} - ${BLUE}Pods${NC} ${PODS}"
  done
  echo -e "\n${YELLOW}Finish :)${NC}\n"
}

# =============================================================================

function GetKubectlContexts() {
  kubectl config get-contexts | sed -e "1d"
}

# =============================================================================

function SetContext() {
  which fzf 2> /dev/null || { MissingFZF; exit 1; }
  local CONTEXT=$(GetKubectlContexts | fzf | awk {' print $1 '} | sort -n)
  if [[ -z "${CONTEXT}" || "${CONTEXT}" == "*" ]]; then
    echo -e "\n${RED}Aborted. Nothing has been changed.${NC}"
  else
    kubectl config use-context "${CONTEXT}"
  fi
}

# =============================================================================
# MAIN
# =============================================================================

[ $(which figlet 2> /dev/null) ] || { MissingFiglet; exit 1; }
[ $(which kubectl 2> /dev/null) ] || { MissingFiglet; exit 1; }

Welcome

# =============================================================================
# OPTIONS
# =============================================================================

if [ -z "$CMD" ]; then
  SetContext
else
  case $CMD in
    "c"|"-c"|"change"|"--change")
      SetContext
      ;;
    "ls"|"-l"|"l"|"--list")
      GetKubectlContexts
      ;;
    "info"|"-i"|"i"|"--info")
      Info
      ;;
    "ns"|"-ns"|"namespaces"|"--namespaces")
      [ "$2" == "describe" ] && DescribrePodsEachNamespace || kubectl get ns
      ;;
    "po"|"-po"|"pods"|"--pods")
      kubectl get po --all-namespaces
      ;;
    "help"|"-h"|"h"|"--help")
      Help
      ;;
    *)
      echo -e "Unknown command $CMD"
      Help && exit 1 ;;
  esac
fi
