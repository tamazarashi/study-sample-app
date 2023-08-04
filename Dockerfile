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
