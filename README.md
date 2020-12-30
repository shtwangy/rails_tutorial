# Ruby Setup
Rubyインストールの確認
```
ruby -v
```

実行
```
ruby index,rb
```

rbenvインストール
```
brew install rbenv ruby-build
rbenv -v
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

rbenv経由でrubyインストール
```
rbenv install 2.6.6
rbenv versions
rbenv global 2.6.6
ruby -v
```

参考：https://prog-8.com/docs/ruby-env

# Ruby on Rails Setup
```
gem install bundler
bundle init
```
