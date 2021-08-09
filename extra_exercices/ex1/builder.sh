docker build -t orcasifilus/t-003-alpine -f alpine.Dockerfile .

docker build -t orcasifilus/t-003-debian -f debian.Dockerfile .

docker run --rm --env SLEEP_DURATION=5 --env WEBSITE_URL="https://comwork.io"  orcasifilus/t-003-alpine

docker run --rm --env SLEEP_DURATION=5 --env WEBSITE_URL="https://comwork.io"  orcasifilus/t-003-debian

docker push orcasifilus/t-003-alpine

docker push orcasifilus/t-003-debian