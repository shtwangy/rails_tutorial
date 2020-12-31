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

DB削除
```
$ rails db:drop
```

レコード挿入
```
$ rails c
irb(main):001:0> User.create!(name: "Buddy Guy", age: 84)
```

レコード検索
```
irb(main):001:0> User.all

irb(main):002:0> user = User.find(1)
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<User id: 1, name: "Buddy Guy", age: 84, created_at: "2020-12-30 16:44:23.304296000 +0000", updated_at: "2020-12-30 16:44:23.304296000 +0000">
irb(main):003:0> user.age
=> #<User id: 1, name: "Buddy Guy", age: 84, created_at: "2020-12-30 16:44:23.304296000 +0000", updated_at: "2020-12-30 16:44:23.304296000 +0000">
irb(main):004:0> user.age
=> 84
irb(main):005:0> user.name
=> "Buddy Guy"
irb(main):006:0> user.id
=> 1
irb(main):007:0> user.created_at
=> Wed, 30 Dec 2020 16:44:23.304296000 UTC +00:00

irb(main):033:0> User.where("age>=80")
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE (age>=80) /* loading for inspect */ LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<User id: 1, name: "Buddy Guy", age: 84, created_at: "2020-12-30 16:44:23.304296000 +0000", updated_at: "2020-12-30 16:54:29.403306000 +0000">]>
```

レコード更新
```
irb(main):022:0> user.name = "rename"
=> "rename"
irb(main):023:0> user
=> #<User id: 1, name: "rename", age: 84, created_at: "2020-12-30 16:44:23.304296000 +0000", updated_at: "2020-12-30 16:44:23.304296000 +0000">
irb(main):025:0> user.save
  TRANSACTION (0.1ms)  begin transaction
  User Update (0.4ms)  UPDATE "users" SET "name" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["name", "rename"], ["updated_at", "2020-12-30 16:53:45.174732"], ["id", 1]]
  TRANSACTION (0.7ms)  commit transaction
=> true
```

# Check Routing
```
$ rails routes
```
絞り込み
```
$ rails routes | grep user
```

# Create CRUD
```
$ rails g scaffold WeightHistory user:references weight:integer memo:string
$ rails db:migrate
```

```
$ rails routes | grep weight
```

# Active Record Callback
https://railsguides.jp/active_record_callbacks.html

# Debug
```Gemfile
gem 'pry-rails'
```

```
$ bundle install
```

Use
```weight_history.rb
  def set_memo
    if memo.nil? || memo == ''
      self.memo = "なし" # 代入の時は'self.'が必要
    end
    binding.pry
  end
```

```
    24: def set_memo
    25:   if memo.nil? || memo == ''
    26:     self.memo = "なし" # 代入の時は'self.'が必要
    27:   end
 => 28:   binding.pry
    29: end

[1] pry(#<WeightHistory>)> 
```
exit
```
[1] pry(#<TweetsController>)>exit
```

# Seed
開発用のテストデータを作成する
```db/seeds.rb
User.create!(name: "Buddy Guy", age: 84)
User.create!(name: "Eric Clapton", age: 75)
```
```
$ rails db:seed
```

