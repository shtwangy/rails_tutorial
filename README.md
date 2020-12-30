# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Setup Ruby
Rubyインストールの確認
```
$ ruby -v
```

rbファイルが実行できるか確認
```
$ ruby index,rb
```

rbenvインストール
```
$ brew install rbenv ruby-build
$ rbenv -v
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source ~/.bash_profile
```

rbenv経由でrubyインストール
```
$ rbenv install 2.6.6
$ rbenv versions
$ rbenv global 2.6.6
$ ruby -v
```

参考：https://prog-8.com/docs/ruby-env

# Setup Ruby on Rails
```
$ gem install bundler
$ bundle init
$ bundle install --path vendor/bundle
$ rails new .
```

`yarn`インストール
```
$ brew install yarn
$ yarn -v
$ yarn install
```

`webpacker`インストール
```
$ rails webpacker:install
```

# MVCモデルについて
- Model：DB関連の処理を担当
- View：画面表示（HTML）を担当
- Controller：リクエスト受付 & レスポンスの返却

# 命名規則
- class: upper camel case
- other: snake case

※例外として定数は全て大文字

# Setup DB
```
$ rails g model User name:string age:integer
$ rails db:create
$ rails db:migrate
```

DB作成の確認
```
$ sqlite3 db/development.sqlite3
sqlite> .schema users
```


