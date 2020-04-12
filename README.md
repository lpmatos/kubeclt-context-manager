<p align="center">
  <img alt="description" src="https://churrops.files.wordpress.com/2018/06/kubernetes.jpg?w=1400" width="250px" float="center"/>
</p>

<h1 align="center">♻️ Kubectl Context Manager ♻️</h1>

<p align="center">
  <strong>Project to help you manage your kubectl contexts</strong>
</p>

<p align="center">
  <a href="https://github.com/lpmatos/kubeclt-context-manager">
    <img alt="Open Source" src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager/graphs/contributors">
    <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/lpmatos/kubeclt-context-manager">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager">
    <img alt="GitHub Language Count" src="https://img.shields.io/github/languages/count/lpmatos/kubeclt-context-manager">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager">
    <img alt="GitHub Top Language" src="https://img.shields.io/github/languages/top/lpmatos/kubeclt-context-manager">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager/stargazers">
    <img alt="GitHub Stars" src="https://img.shields.io/github/stars/lpmatos/kubeclt-context-manager?style=social">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager/commits/master">
    <img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/lpmatos/kubeclt-context-manager">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager">
    <img alt="Repository Size" src="https://img.shields.io/github/repo-size/lpmatos/kubeclt-context-manager">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager/issues">
    <img alt="Repository Issues" src="https://img.shields.io/github/issues/lpmatos/kubeclt-context-manager">
  </a>

  <a href="https://github.com/lpmatos/kubeclt-context-manager/blob/master/LICENSE">
    <img alt="MIT License" src="https://img.shields.io/github/license/lpmatos/kubeclt-context-manager">
  </a>
</p>

<p align="center">
  <a href="#-how-to-contribute">How to contribute</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-license">License</a>
</p>

## ▶️ Getting Started

Starting with **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/kubeclt-context-manager.git -b master
```

This will give access on your local machine to this project.

## Buy me a coffee

Pull requests are welcome. If you'd like to support the work and buy me a ☕, I greatly appreciate it!

<a href="https://www.buymeacoffee.com/EatdMck" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 100px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Prerequisites

To this project you yeed:

- Bash.
- Linux System.
- Install manager dependencies:
  - **FZF**.
  - **Figlet**.
  - **Kubectl**.

## Built with

- **Dev Tools**
  - [Bash](https://www.gnu.org/software/bash/)

- **Other Tools**
  - [FZF](https://github.com/junegunn/fzf)
  - [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## How to use it?

1. Install the plugin in your System.
2. Run the manager.

## Description

Why do boring task to change a kubectl context, when u can do this in a simple command? This is a simple Bash script that perform this for you.

![Alt text](docs/images/MANAGER.PNG?raw=true "Manager")

Besides everything, there are other features:

* Cluster information about all pods in all namespaces.
* Information about pods status in all namespaces.
* List o your contexts.
* Describe pods each namespace.

## Kubectl

![Alt text](docs/images/KUBECTL.PNG?raw=true "Kubectl")

Kubectl is a command line tool for controlling Kubernetes clusters. For more information, access the [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) documentation or [this](docs/annotations/commands.md).

## Installation

To install this plugin you can run the installation script:

```bash
git clone https://github.com/lpmatos/kubeclt-context-manager.git
bash install.sh
```

Or manually:

```bash
curl -LO https://raw.githubusercontent.com/lpmatos/kubeclt-context-manager/master/install.sh
chmod +x ./manager.sh
cp ./manager.sh /usr/local/bin/manager
rm -rf ./manager.sh
```

## 🐋 Development with Docker

Steps to build a Docker Image.

### Build

```bash
docker image build -t <IMAGE_NAME> -f <PATH_DOCKERFILE> <PATH_CONTEXT_DOCKERFILE>
docker image build -t <IMAGE_NAME> . (This context)
```

### Run

Steps to run a Docker Container.

* **Linux** running:

```bash
docker container run -d -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
docker container run -it --rm --name <CONTAINER_NAME> -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
```

* **Windows** running:

```
winpty docker.exe container run -it --rm <IMAGE_NAME> <COMMAND>
```

For more information, access the [Docker](https://docs.docker.com/) documentation or [this](docs/annotations/docker.md).

## 🐋 Development with Docker Compose

Build and run a docker-compose.

```bash
docker-compose up --build
```

Down all services deployed by docker-compose.

```bash
docker-compose down
```

Down all services and delete all images.

```bash
docker-compose down --rmi all
```

## Usage

<kbd>manager --help</kbd> - Helper

## Params

![Alt text](docs/images/USAGE.PNG?raw=true "Usage")

## Link Reference

* https://kubernetes.io/pt/docs/reference/kubectl/cheatsheet/
* https://medium.com/platformer-blog/using-kubernetes-secrets-5e7530e0378a
* https://forums.docker.com/t/docker-compose-entrypoint-bin-sh-c-exit-code-always-0-when-exit-with-shell-variable-error-value/60204

## 🎒 How to contribute

1. Make a **Fork**.

2. Follow the project organization.

3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard.

4. Make the **Commit**.

5. Open a **Pull Request**.

6. Wait for your pull request to be accepted.. 🚀

Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

## 🔔 Add to git and push

You must send the project to your GitHub after the modifications

```bash
git add -f .
git commit -m "Added - Fixing somethings"
git push origin master
```

## 📋 Versioning

- [CHANGELOG](CHANGELOG.md)

## 📜 License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## ☎️ Contacts

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

* **Email**: luccapsm@gmail.com
* **Linkedin**: www.linkedin.com/in/lucca-pessoa-4abb71138/

[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/lucca.pessoa.9)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/lpmatos)

## ✨ Contributors

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/kubectl-context-manager/commits?author=lpmatos" title="Code">💻</a></a></td>
  <tr>
</table>

## 🐯 Autor

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/kubectl-context-manager/commits?author=lpmatos" title="Code">💻</a> <a href="https://github.com/lpmatos/kubectl-context-manager/commits?author=lpmatos" title="Design">🎨</a></td>
  <tr>
</table>

## Project Status

* ✔️ Finish

---

<p align="center">Feito com ❤️ by <strong>Lucca Pessoa :wave:</p>
