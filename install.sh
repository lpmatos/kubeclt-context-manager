# ==============================================================================
## DESCRIPTION: Setup Installation.
## NAME: install.sh
## AUTHOR: Lucca Pessoa da Silva Matos
## DATE: 12.04.2020
## VERSION: 1.0
# ==============================================================================

type curl 2> /dev/null || { echo -e "\nCurl not install in your System..." ; exit 1; }

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

URL="https://raw.githubusercontent.com/lpmatos/kubeclt-context-manager/master/code/manager.sh"

# ==============================================================================
# FUNCTIONS
# ==============================================================================

function Welcome(){
  echo -e "\n"
  echo "Install Kubectl Manager" | figlet
  echo -e "\n-------------------------------------------------"
  echo "* Welcome ${USER}! It's now ${DATE_INFO_SHORT}"
  echo -e "* ${DATE_INFO}"
  echo -e "* System - ${OS}"
  echo -e "*"
  echo -e "* Version: ${YELLOW}1.0${NC}"
  echo -e "* Autor: ${YELLOW}Lucca Pessoa da Silva Matos${YELLOW}${NC}"
  echo -e "* Description: ${BLUE}Install Kubectl Context Manager${BLUE}${NC}"
  echo -e "-------------------------------------------------\n"
}

function ManagerAlredyExist(){
  echo -e "\nManager is already installed on the System! Bye Bye!\n" && exit 1
}

function InstallManager(){
  echo -e "\n${YELLOW}Installing Manager...${YELLOW}${NC}"
  curl -LO ${URL}
  echo -e "\n${YELLOW}Giving permissions...${YELLOW}${NC}"
  chmod +x ./manager.sh
  echo -e "\n${YELLOW}Copying manager to${YELLOW}${NC} ${BLUE}/usr/local/bin...${BLUE}${NC}"
  cp ./manager.sh /usr/local/bin/manager
  echo -e "\n${YELLOW}Removing manager script of this context${NC}"
  rm -rf ./manager.sh
}

# ==============================================================================
# MAIN
# ==============================================================================

Welcome

[ -f "/usr/local/bin/manager" ] && ManagerAlredyExist || InstallManager

# ==============================================================================
# VALIDATION
# ==============================================================================

[ $(which manager) ] && echo -e "\n${GREEN}Successful Installation!\n${GREEN}${NC}" || echo -e "\n${RED}Manager installation failed! Exit...\n${RED}${NC}"; exit 1
