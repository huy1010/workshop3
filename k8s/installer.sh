#!/bin/bash

set -e

kubectl_version='1.23.9'
kubectl_checksum='053561f7c68c5a037a69c52234e3cf1f91798854527692acd67091d594b616ce'

eksctl_version='0.144.0'
eksctl_checksum='f91a12e7f72bce41a2529053d3a22351ba1fd9bb3517f9d1d1ee74dda1e43afc'

kustomize_version='4.5.7'
kustomize_checksum='701e3c4bfa14e4c520d481fdf7131f902531bfc002cb5062dcf31263a09c70c9'

yq_version='4.30.4'
yq_checksum='30459aa144a26125a1b22c62760f9b3872123233a5658934f7bd9fe714d7864d'


download_and_verify () {
  url=$1
  checksum=$2
  out_file=$3

  curl --location --show-error --silent --output $out_file $url

  echo "$checksum $out_file" > "$out_file.sha256"
  sha256sum --check "$out_file.sha256"

  rm "$out_file.sha256"
}

yum install --quiet -y findutils jq tar bash-completion python3 pip3 amazon-linux-extras

pip3 install awscurl

# kubectl
download_and_verify "https://dl.k8s.io/release/v$kubectl_version/bin/linux/amd64/kubectl" "$kubectl_checksum" "kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin
echo "install successfully"

# eksctl
download_and_verify "https://github.com/weaveworks/eksctl/releases/download/v$eksctl_version/eksctl_Linux_amd64.tar.gz" "$eksctl_checksum" "eksctl_Linux_amd64.tar.gz"
tar zxf eksctl_Linux_amd64.tar.gz
chmod +x eksctl
mv ./eksctl /usr/local/bin
rm -rf eksctl_Linux_amd64.tar.gz

# kustomize
download_and_verify "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${kustomize_version}/kustomize_v${kustomize_version}_linux_amd64.tar.gz" "$kustomize_checksum" "kustomize.tar.gz"
tar zxf kustomize.tar.gz
chmod +x kustomize
mv ./kustomize /usr/local/bin
rm -rf kustomize.tar.gz

# yq
download_and_verify "https://github.com/mikefarah/yq/releases/download/v${yq_version}/yq_linux_amd64" "$yq_checksum" "yq"
chmod +x ./yq
mv ./yq /usr/local/bin