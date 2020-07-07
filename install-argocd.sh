helm2 repo add argo https://argoproj.github.io/argo-helm
helm2 install --name argocd argo/argo-cd -f argocd-values.yaml --no-crd-hook
