#!/usr/bin/env bash

brew tap ecg-gcp/brew git@github.es.ecg.tools:ecg-gcp/brew.git
brew install kubectl-plugins
brew install kubectl-chart

gcloud auth application-default login

helm repo add stable https://charts.helm.sh/stable
helm plugin install https://github.com/hayorov/helm-gcs.git
helm repo add coe gs://coe-helm-charts
