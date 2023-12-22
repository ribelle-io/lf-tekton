#!/bin/sh

# install tekton pipelines 
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
kubectl get pod -n tekton-pipelines --watch

# install tekton cli
brew install tektoncd-cli

# install tekton triggers
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml
kubectl get pods --namespace tekton-pipelines --watch

# install tekton dashboard
kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.38.0/release-full.yaml
kubectl get pods --namespace tekton-pipelines --watch

# start proxy
kubectl proxy

