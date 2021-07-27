# EC site development

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発

### デモ
![Add Blur and Ima](https://user-images.githubusercontent.com/82434457/127146174-f8adbbf1-a8ba-421c-88d6-0e1aeac5bff5.gif)

# サイト概要
* 通販では注文に応じて製作する受注生産型としている
* 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない
* 送料は1配達につき全国一律800円
* 友人や家族のプレゼントなど、注文者の住所以外にも商品を発送できる
* 支払方法はクレジットカード、銀行振込から選択できる

# ER図
![Torres_ER](https://user-images.githubusercontent.com/82434457/127075889-a8119918-8dd2-47f9-be17-cff735242033.png)

# アプリケーション詳細設計書
## 顧客側(public)
<img width="727" alt="アプリケーション詳細設計書_顧客側" src="https://user-images.githubusercontent.com/82434457/127076965-03a1770f-1363-4df1-9d52-ec25b09ffcd0.png">

## 管理者側(admin)
<img width="715" alt="アプリケーション詳細設計書_管理者側" src="https://user-images.githubusercontent.com/82434457/127076954-582e6a11-7175-490c-9d94-662c4f981c29.png">

# 環境構築
```
$ git clone git@github.com:webcamp-torres/Nagano_Cake_new.git
$ rails db:migrate
$ rails db:seed
$ rails cd Nagano_Cake_new
$ bundle install
$ rails s
```

# 使用言語
* HTNL&CSS

* Ruby (2.6.3)

* Ruby on Rails (5.2.6)

* Javascript

# チーム -Torres-
* [kenta](https://github.com/Kenta-Sugaya)
* [makisan](https://github.com/makisan3)
* [megu](https://github.com/ogmegumi)
* [waji-](https://github.com/kgdskc)
