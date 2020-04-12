# CHANGELOG

All important changes to this project will be added to this file! This changelog will be based on [Keep a change log](http://keepachangelog.com/)

## 2.0.0 - [12-04-2020]

### Added

* Dockerfile support.
* Docker-compose support.
* Dot-Env support.
* Editorconfig.
* Docker Setup script.
* Create function DescribrePodsEachNamespace in manager script.

## 1.0.0 - [11-04-2020]

### Added

* Adding first versin of manager.sh:
  * Manager Kubeconfig Contexts.
  * Show cluster infor about the number of namespaces and pods.
  * Show all namespaces.
  * Show all pods in all namespaces.
* Create install script.
* README.md, CHANGELOG.md and LICENSE.
* Adding docs folder with some images and annotations about kubectl commands.
* Functions:
  * missingFZF()
  * missingKubectl()
  * missingFiglet()
  * help()
  * welcome()
  * info()
  * getContexts()
  * setContext()
* Simple CLI with some params:
  * List contexts
  * List namespaces
  * List pods
  * Cluster info
  * Change kubectl context
