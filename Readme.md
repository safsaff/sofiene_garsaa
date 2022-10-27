	
kubectl create secret generic mysql-root-pass --from-literal=password=server

	
kubectl create secret generic mysql-user-pass --from-literal=username=apx --from-literal=password=apx03

	
kubectl create secret generic mysql-db-url --from-literal=database=spring --from-literal=url="jdbc:mysql://social-login-app-mysql:3306/spring?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false&allowPublicKeyRetrieval=true"

###Deploy Ingress Controllor###

1- controller_tag=$(curl -s https://api.github.com/repos/kubernetes/ingress-nginx/releases/latest | grep tag_name | cut -d '"' -f 4)



2- wget https://github.com/kubernetes/ingress-nginx/archive/refs/tags/${controller_tag}.tar.gz

3- tar xvf ${controller_tag}.tar.gz


4- cd ingress-nginx-${controller_tag}


5- cd charts/ingress-nginx/

5- kubectl create namespace ingress-nginx

6- helm install -n ingress-nginx ingress-nginx  -f values.yaml .
