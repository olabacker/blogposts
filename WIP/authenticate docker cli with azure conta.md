authenticate docker cli with azure container repository 

az login

$TOKEN=$(az acr login --name myrepo.azurecr.io --expose-token --output tsv --query accessToken)
docker login myrepo.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password $TOKEN