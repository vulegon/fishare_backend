class Fish < ApplicationRecord
  # 魚を格納するモデル
  # 釣れる魚は殆ど変わらないことから削除することは想定していない
  has_many :catchable_fishes
  has_many :spots, through: :catchable_fishes

  NAMES = [
    "カサゴ",
    "ニジマス",
    "マグロ",
    "サバ",
    "イワシ",
    "タイ",
    "ヤマメ",
    "アマゴ",
    "アユ",
    "フナ",
    "シーバス",
    "シャコ",
    "ブラウントラウト",
    "モロコ",
    "コイ",
    "クロダイ",
    "ヒラメ",
    "ニシン",
    "ギンポ",
    "ソイ",
    "アンコウ",
    "フグ",
    "ハゼ",
    "ヒラスズキ",
    "ウナギ",
    "タナゴ",
    "サケ",
    "アジ",
    "ワカサギ",
    "マス",
    "シジミ",
    "ワタリガニ",
    "ホウボウ",
    "カワハギ",
    "キンギョ",
    "トビウオ",
    "ウツドキ",
    "クマノミ",
    "ゴンズイ",
    "シマアジ",
    "メジナ",
    "キス",
    "カレイ",
    "ホシガレイ",
    "ツチガレイ",
    "ソウシハギ",
    "ガンギエイ",
    "コノシロ",
    "カワムツ",
    "アブラボウズ",
    "アオウオ",
    "カンパチ",
    "イセエビ",
    "ウシノシタ",
    "クロカジキ",
    "イシダイ",
    "キタマクラ",
    "メダイ",
    "アオリイカ",
    "コウイカ",
    "サクラダイ",
    "タカベ",
    "トウゴロウイカ",
    "ワニゴチ",
    "イシガキダイ",
    "ウルメイワシ",
    "オモリウオ",
    "カゴカキダイ",
    "キュウセン",
    "クサフグ",
    "コショウダイ",
    "ヒメジ",
    "マイワシ",
    "マダイ",
    "ミツボシガネ",
    "ヤガラ",
    "ユメカサゴ",
    "ヨシノボリ",
    "ワカシ",
  ]

  validates :name, uniqueness: true, presence: true, inclusion: { in: NAMES, message: "魚の種類の名前はモデルに存在しない値です" }
end
