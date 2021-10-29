# README

## 環境構築

- `.env`を作成する

```
touch .env
```

- コンテナを作成する

```
docker-compose build
```

- runnerコンテナに入る

```
docker-compose up -d runner
docerk-compose exec runner bash
```

- bundle install

```
bundle install
```

- databaseを作成する

```
rails db:create RAILS_ENV=development
rails db:create RAILS_ENV=test
```

## テスト実行

- runnerコンテナで実行

```
rspec spec/指定したファイル
```
