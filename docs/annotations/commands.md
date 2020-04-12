# Kubectl Commands - Cheat Sheet

This is a list with the most used commands in kubectl.

## General Info

- kubectl cluster-info
- kubectl cluster-info dump
- kubectl config view

## Namespaces

- kubectl get ns

## Pods and Nodes

- kubectl get pods
- kubectl get no -o wide
- kubectl get po -o wide --all-namespaces
- kubectl get pods --all-namespaces -o json
- kubectl get nodes --all-namespaces -o json
- kubectl exec $POD_NAME env
- kubectl exec -ti $POD_NAME bash
- kubectl delete pods --all

## Deployments

- kubectl get deployments --all-namespaces
- kubectl delete deployments/apine-test

## Logs

- kubectl logs my-pod
- kubectl logs my-pod -c my-container

## DeamonSet

- kubectl get ds


## Políticas de Segurança

- kubectl get psp

## Network Policies

- kubectl get ns
- kubectl get networkpolicies --all-namespaces

## Volumes Persistentes

-kubectl get pv

## Create Job from YAML file

- kubectl create -f [job.yaml]
- kubectl describe job [job-name]
- kubectl get jobs

## View services accounts config

- kubectl get serviceAccounts

## Basic container deploy

- kubectl create -f [pod-specification].yaml
- [pod-specification].yaml
		apiVersion: v1
		kind: Pod
		metadata:
		  name: shell-demo
		spec:
		  volumes:
		  - name: shared-data
			emptyDir: {}
		  containers:
		  - name: nginx
			image: nginx
			volumeMounts:
			- name: shared-data
			  mountPath: /usr/share/nginx/html
- kubectl get pod [pod]	
- kubectl exec -it [pod] -- /bin/bash

## Exploiting

- curl --insecure https://[ip]:10250/pods | jq

## Especify namespace

- kubectl get deployment [name] --namespace [namespace] -o yaml

## Pod Port forwarding

- kubectl port-forward $POD_NAME 8080:8080 >> /dev/null &

## Listar Secrets

- kubectl get secret

## Extração de Secrets

- kubectl describe secret [secret-name]
- kubectl get secret [secret-name] -o json
- printf $(kubectl get secret [secret-name] -o jsonpath="{.data}" | [decode-specifi]);echo

## Create Secrets 

- echo -n some_text_to_encode | base64

## DeamonSet Logs 

- kubectl logs ds/[name] -f

## Copy files from/to pods 

- kubectl cp <file-spec-src> <file-spec-dest> -c <specific-container>
- kubectl cp <some-namespace>/<some-pod>:/tmp/example /tmp/example

## View Cluster Roles 

- kubectl get clusterroles

## Deploy YAML using variables

- export NOODEPOOL=$NodePool
- kubectlenvsubst < basic-deploiment-nodePool-selector.yaml | kubectl apply  -f -

## Rollback 

- kubectl rollout history deployment [deployment-name]
- kubectl rollout undo deployments [deployment-name] --to-revision=[rollout history number]

## Resources 

kubectl top pod -n [namespace]

For more information access https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
