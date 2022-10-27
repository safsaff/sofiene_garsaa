	
kubectl create secret generic mysql-root-pass --from-literal=password=server

	
kubectl create secret generic mysql-user-pass --from-literal=username=apx --from-literal=password=apx03

	
kubectl create secret generic mysql-db-url --from-literal=database=demo --from-literal=url="jdbc:mysql://social-login-app-mysql:3306/spring?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false&allowPublicKeyRetrieval=true"



