# ==============================================================================
## DESCRIPTION: Docker Setup Install Kubectl Context Manager.
## NAME: install
## AUTHOR: Lucca Pessoa da Silva Matos
## DATE: 12.04.2020
## VERSION: 1.0
# ==============================================================================

type curl 2> /dev/null || { echo -e "\nCurl not install in your Syste..." ; exit 1; }

echo -e "\nConfigure Kubeconfig..."

echo -e "${KUBECONFIG_CLUSTER}" | base64 -d > "${KUBECONFIG}"

curl -LO https://raw.githubusercontent.com/lpmatos/kubeclt-context-manager/master/install.sh

chmod +x ./install.sh

bash ./install.sh

rm -rf ./install.sh
