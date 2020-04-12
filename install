# ==============================================================================
## DESCRIPTION: Setup Install Kubectl Context Manager.
## NAME: install
## AUTHOR: Lucca Pessoa da Silva Matos
## DATE: 12.04.2020
## VERSION: 1.0
# ==============================================================================

type curl 2> /dev/null || { echo -e "\nCurl not install in your Syste..." ; exit 1; }

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

if [ "${OS}" = "Linux" ]; then DATE_CMD="date"; else DATE_CMD="gdate"; fi

DATE_INFO=$(${DATE_CMD} +"%Y-%m-%d %T")
DATE_INFO_SHORT=$(${DATE_CMD} +"%A %B")
USER=$(whoami)

URL="https://raw.githubusercontent.com/lpmatos/kubeclt-context-manager/master/manager"

# ==============================================================================
# FUNCTIONS
# ==============================================================================

function welcome(){
  echo -e "\n"
  echo "Install Kubectl Manager" | figlet
  echo -e "\n-------------------------------------------------"
  echo "* Welcome ${USER}! It's now ${DATE_INFO_SHORT}"
  echo -e "* ${DATE_INFO}"
  echo -e "* System - ${OS}"
  echo -e "*"
  echo -e "* Autor: Lucca Pessoa da Silva Matos"
  echo -e "* Description: Install Kubectl Context Manager"
  echo -e "-------------------------------------------------\n"
}

# ==============================================================================
# MAIN
# ==============================================================================

welcome

if [ -f "/usr/local/bin/manager" ]; then
  echo -e "\nManager Alredy in your Syste! Bye Bye!\n" && exit 1
else
  echo -e "\nInstall Manager..."
  curl -LO ${URL}
  echo -e "Given permissions..."
  chmod +x ./manager
  echo -e "Move manager to /usr/local/bin..."
  mv ./manager /usr/local/bin/manager 
fi

# ==============================================================================
# VALIDATION
# ==============================================================================

type manager 2> /dev/null || { echo -e "\nManager installation failed! Exit..." ; exit 1; }
