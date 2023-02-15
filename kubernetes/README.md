
Install with Homebrew on macOS:
    brew install kubectl

Manually installation for Apple silicon (optional)
1. Download the latest release:
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
2. Validate the binary (optional)
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl.sha256"
    echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check
3. Make the kubectl binary executable.
    chmod +x ./kubectl
4. Move the kubectl binary to a file location on your system PATH.
    sudo mv ./kubectl /usr/local/bin/kubectl
    sudo chown root: /usr/local/bin/kubectl
    Note: Make sure /usr/local/bin is in your PATH environment variable.
5. After installing the plugin, clean up the installation files
    rm kubectl kubectl.sha256

Test to ensure the version you installed is up-to-date:
    kubectl version --client
    kubectl version --client --output=yaml
    kubectl version --client --output=json

Verify kubectl configuration:
In order for kubectl to find and access a Kubernetes cluster, it needs a kubeconfig file, which is created automatically when you create a cluster using kube-up.sh or successfully deploy a Minikube cluster. By default, kubectl configuration is located at ~/.kube/config.


setup the pune cluster for kubernetes 
sudo vi ~/.kube/config
paste the data from kubeconfig

add this 10.131.131.27 k8s-master.e4r.internal to your /etc/hosts file

start pune vpn

Check that kubectl is properly configured by getting the cluster state:
    kubectl cluster-info

If kubectl cluster-info returns the url response but you can't access your cluster, to check whether it is configured properly, use:
    kubectl cluster-info dump

alias kubectl-e4r='kubectl --kubeconfig=/Users/abhishekghosh/Desktop/E4R-final/cadc-si-deploy/kubernetes/e4r-kubeconfig'


FROM --platform=linux/amd64 cadc-tomcat:latest
--platform is needed