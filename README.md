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
