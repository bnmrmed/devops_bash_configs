#!/usr/bin/env bash

source <(kubectl completion bash)

################################################################################
# Kubernetes
################################################################################
alias kub="kubectl"

################################################################################
## Kubernetes - Config
################################################################################
alias kubview="kubectl config view"
alias kubcontext="kubectl config current-context"
alias kubsetcontext="kubectl config set-context"
alias kubrmcontext="kubectl config delete-context"
alias kubgetcontext="kubectl config get-contexts"
alias kubcluster="kubectl config get-clusters"
alias kubrmcluster="kubectl config delete-cluster"

################################################################################
## Kubernetes - Deployments
################################################################################
alias kuba="kubectl apply"
alias kubaf="kubectl apply -f"
alias kubd="kubectl delete"
alias kubdf="kubectl delete -f"

################################################################################
## Kubernetes - Pods
################################################################################
alias kubpodsls="kubectl get pods --namespace "
alias kubpodslsa="kubectl get pods --all-namespaces --show-labels"
alias kubpodd="kubectl describe pod"

################################################################################
## Kubernetes - Namespaces
################################################################################
alias kubnsls="kubectl get namespaces --show-labels"

################################################################################
## Kubernetes - Login
################################################################################
function kublogin() {
    pod_name=$(kubectl get pods --namespace comet | grep $1 | awk '{print $1}')
    kubectl exec --namespace comet -it $pod_name -- /bin/sh
}

################################################################################
## Kubernetes - Dashboard
################################################################################
function kubdashsetup {
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml && kubectl config set-credentials docker-desktop --token="$(kubectl -n kube-system describe secret default | grep token: | awk '{print $2}')" && nohup kubectl proxy > $HOME/.kube/dashboard.log &
}
function kubdashsyspid {
    if ps -elf | grep 'kubectl proxy' > /dev/null; then
        kubdash_sys_pid=$(ps -elf | grep 'kubectl proxy' | awk '{print $2}')
    else
        kubdash_sys_pid="00000"
    fi
    # echo "DEBUG: Dashboard System PID ($kubdash_sys_pid)"
}
function kubdashfilepid() {
    if  [ -f "$HOME/.kube/dashboard.pid" ]; then
        kubdash_file_pid=$(cat $HOME/.kube/dashboard.pid)
    else
        kubdash_file_pid="00000"
    fi
    # echo "DEBUG: Dashboard File PID ($kubdash_file_pid)"
}
function kubdashstatus() {
    kubdashsyspid
    kubdashfilepid
    kubdash_status="Unknown"
    if [[ "$kubdash_sys_pid" == "00000" && "$kubdash_file_pid" == "00000" ]]; then
        kubdash_status="Stopped"
    elif [ "$kubdash_sys_pid" == "00000" ]; then
        kubdash_status="Stopped"
    else
        kubdash_status="Running"
    fi
    echo $kubdash_status
}
function kubdashstart() {
    kubdashsyspid
    kubdashfilepid
    if [ "$kubdash_status" == "Stopped" ]; then
        echo "Starting..."
        nohup kubectl proxy > $HOME/.kube/dashboard.log &
        echo $! > $HOME/.kube/dashboard.pid
        echo "Started"
    else
        echo "Already Running"
    fi
}
function kubdashstop() {
    kubdashsyspid
    kubdashfilepid
    if [[ "$kubdash_file_pid" == "00000" && "$kubdash_sys_pid" == "00000" ]]; then
        echo "Stopped"
    elif [ "$kubdash_sys_pid" == "00000" ]; then
        # If process not running but PID file exists cleanup the file
        echo "Stopped"
        rm -f $HOME/.kube/dashboard.pid
    else
        echo "Stopping..."
        if [[ "$kubdash_file_pid" == "$kubdash_sys_pid" ]]; then
            kill $kubdash_file_pid
        else
            kill $kubdash_sys_pid
        fi
        rm -f $HOME/.kube/dashboard.pid
        echo "Stopped"
    fi
}

# Use this Function to Setup and Control the Dashboard
function kubdash() {
    if [ "$1" == "stop" ]; then
        kubdashstop
    elif [ "$1" == "start" ]; then
        kubdashstart
    elif [ "$1" == "restart" ]; then
        kubdashstop
        sleep 10
        kubdashstart
    elif [ "$1" == "status" ]; then
        kubdashstatus
    elif [ "$1" == "setup" ]; then
        kubdashsetup
    else
        echo "Usage: kubdash [start|stop|status|setup]"
    fi
}

################################################################################
# Kubernetes - Credentials
################################################################################
function kubdefaulttoken() {
    kubectl -n kube-system describe secret default | grep token: | awk '{print $2}'
}
