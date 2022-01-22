# テーブル設計

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

## parks テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| address               | string     |                                |
| opening_hours         | string     |                                |
| parking               | string     |                                |
| vending_machine       | string     |                                |
| hand_wash             | string     |                                |
| toilet                | string     |                                |
| breastfeeding_room    | string     |                                |
| diaper_changing_table | string     |                                |
| play_set              | string     |                                |
| sandbox               | string     |                                |
| grass                 | string     |                                |
| kick_bike             | string     |                                |
| store                 | string     |                                |
| restaurant            | string     |                                |
| user                  | references | null: false, foreign_key: true |

### Association

- has_many :comments
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
