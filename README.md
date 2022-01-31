# アプリケーション名
Parknavi


# アプリケーション概要
全国の公園情報を検索、閲覧することができる


# URL
デプロイ未実施のため、実施後記述します


# テスト用アカウント
サンプル１  
mail:sss@sss / password:s111111


# 利用方法
ユーザー情報を登録してログインすると公園情報の投稿・編集、レビュー投稿、マイページ機能を利用することができる。  
ログインしなくても公園情報を閲覧することができる。


# 目指した課題解決
・同じ公園ばかりでは飽きるのでたまには違う公園にもいってみたい。近くにどんな公園があるのか知りたい。  
→地図で検索できる機能  


・どんな遊びができるのか？駐車場やトイレ、自動販売機はあるのか？子供が小さいほど外出先の情報が少ないと不安が多い。  
→オプションで詳細がわかる機能  


・近くの評価の高い公園にいきたい  
→都道府県別ランキング



# 洗い出した要件

・ユーザー新規登録機能  
・キーワード・複数条件から探す機能  
・地図から探す機能  
・公園情報投稿機能  
・公園詳細表示機能  
・公園詳細編集機能  
・マイページ機能  
・ユーザー情報編集機能  
・お気に入り登録機能  
・レビュー投稿機能  
・居住エリア人気ランキング機能  




# 実装した機能についての画像やGIFおよびその説明
## ユーザー新規登録機能  
・ニックネーム、メールアドレス、パスワード、居住地の登録ができる  

[![Image from Gyazo](https://i.gyazo.com/2595b0ea777c3c959446d23dc7d59255.png)](https://gyazo.com/2595b0ea777c3c959446d23dc7d59255)

## キーワード・複数条件から探す機能  
・条件を入力・選択して検索すると該当する公園一覧が検索結果ページに表示される  

## 公園情報投稿機能  
・公園名、都道府県、住所、開園時間、手洗い場有無、トイレ有無、駐車場有無、自動販売機有無、遊具有無、砂場有無、キックバイク可否、広場有無、売店有無、レストラン有無、授乳室有無、おむつ交換台有無
が入力できる

## 公園詳細表示機能  
・公園名、住所、開園時間、手洗い場有無、トイレ有無、駐車場有無、遊具有無、乳幼児向け遊具有無、砂場有無、キックバイク可否、広場有無、売店有無、レストラン有無、授乳室有無、おむつ交換台有無 が表示される。

## 公園詳細編集機能  
・公園名、住所、開園時間、手洗い場有無、トイレ有無、駐車場有無、遊具有無、乳幼児向け遊具有無、砂場有無、キックバイク可否、広場有無、売店有無、レストラン有無、授乳室有無、おむつ交換台有無 が編集できる。

## マイページ機能  
・ニックネームと居住地、お気に入り登録した公園一覧が表示される


## ユーザー情報編集機能  
・居住地の情報を変更できる


## お気に入り登録機能  
・お気に入り登録した公園をマイページで一覧で見ることができる


## レビュー投稿機能  
・投稿されている公園に写真・口コミ・星評価が投稿できる。
投稿されたレビューは公園詳細ページで見ることができる。


# 実装予定の機能
・地図から探す機能  
  googleMAP上に登録されている公園がピン表示される

・居住エリア人気ランキング機能  
  居住地にある公園の人気ランキングトップ５がトップページに表示される

# データベース設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| prefecture_id      | integer | null: false               |

### Association

- has_many :parks
- has_many :comments
- has_many :favorites


## parks テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| address               | string     |                                |
| opening_hours         | string     |                                |
| parking               | boolean    |                                |
| vending_machine       | boolean    |                                |
| hand_wash             | boolean    |                                |
| toilet                | boolean    |                                |
| breastfeeding_room    | boolean    |                                |
| diaper_changing_table | boolean    |                                |
| play_set              | boolean    |                                |
| sandbox               | boolean    |                                |
| grass                 | boolean    |                                |
| kick_bike             | boolean    |                                |
| store                 | boolean    |                                |
| restaurant            | boolean    |                                |
| user                  | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :favorites
- belongs_to :user

## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| user             | references | null: false, foreign_key: true |
| park             | references | null: false, foreign_key: true |
| text             | text       | null: false                    |
| star             | float      | null: false                    |

### Association

- belongs_to :user
- belongs_to :park

## favorites テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| user             | references | null: false, foreign_key: true |
| park             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :park

[![Image from Gyazo](https://i.gyazo.com/c7d18239af9d39124654d9998a5cc19b.png)](https://gyazo.com/c7d18239af9d39124654d9998a5cc19b)

# 開発環境
・HTML  
・CSS  
・Rails 6.0.4.4  
・VSCode(Visual Studio Code)





