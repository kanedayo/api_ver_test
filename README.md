APIのバージョニング
---
##参考URL
[RailsでAPI作成とAPIのテストのまとめ](http://ruby-rails.hatenadiary.com/entry/20150108/1420675366)

``` rspecのインストール
#Gemfile
gourp :development, :test do
  gem 'rspec-rails'
end

$ bundle install
$ rails g rspec:install

$ rake db:test:prepare
```

実行
```
$ rake db:migrate RAILS_ENV=test
```

基本構造
```
RSpec.describe XXX, :type => :model do
  it "AA" do # example(AA)
    expect( xxx ).to be_valid
  end

  describe "BB" do # グルーピング可能
    it "BB-00" do # example(BB-00)
      expect( xxx ).not_to be_valid
    end
  end
end
```

``` Guard関連
# Gemfile
gem 'terminal-notifier-guard'
gem 'guard-rspec'
$ guard init rspec
$ bundle exec guard
```

参考URL:
FactoryGirl:
http://qiita.com/yui-knk/items/bf5ec1bf382e965660b2
https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md