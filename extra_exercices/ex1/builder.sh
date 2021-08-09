docker build -t orcasifilus/t-003-alpine -f alpine.Dockerfile .

docker build -t orcasifilus/t-003-debian -f debian.Dockerfile .

docker push orcasifilus/t-003-alpine

docker push orcasifilus/t-003-debian
