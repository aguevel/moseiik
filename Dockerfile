FROM ubuntu:latest

#installation de cargo dans le docker
RUN apt-get update && \
    apt-get install -y &&\
    apt install cargo -y
    
RUN apt-get update && apt-get install -y wget unzip && apt install cargo -y

#Definition du repertoire de travail
WORKDIR /app

# Copiez le code source dans le conteneur
COPY . /app

#telechargement des images de test
RUN wget "https://filesender.renater.fr/download.php?token=178558c6-7155-4dca-9ecf-76cbebeb422e&files_ids=33679270" -O images.zip && \
	unzip images.zip && mv images ./assets

#CMD uname -m
CMD cargo test --release

#cmd to build : sudo docker build --platform=x86_64 -t moseiik:latest -f Dockerfile .
# 		sudo docker build --platform=arm64 -t moseiik:latest -f Dockerfile .
#cmd to run : sudo docker run moseiik:latest
