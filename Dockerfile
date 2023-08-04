# jarのビルド
mvn clean package
# コンテナイメージのビルド
docker build -t hello-app .
# ローカルリポジトリに登録されていることの確認(hello-appがあること)
docker images hello-app
# コンテナの実行
docker run -p 7001:7001 --name hello-app --rm hello-app
# REST APIへのリクエスト(別のターミナルから)
curl -X GET localhost:7001/api/hello

FROM docker.io/eclipse-temurin:17-jre-alpine
ENV HOME="/root"
RUN mkdir $HOME
COPY hello-app.jar $HOME
#ARG version=1
#FROM busybox:$version

# httpd container
#ENV HOME="/var/www/html/"
#RUN mkdir $HOME
#COPY index.html $HOME
#EXPOSE 80
#CMD ["-h", "/var/www/html/"]
#ENTRYPOINT [ "httpd", "-f" ]
