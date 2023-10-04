ActiveRecord::Base.transaction do
  (1..10).each_with_index do |user, i|
    name = "tester#{i}"
    password = "Password#{1}"
    email = "example#{i}@example.com"
    User.create!(name: name, password: password, email: email)
  end
end

fish_names = [
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
fish = fish_names.map { |fish_name| Fish.new(name: fish_name) }
Fish.import fish

fishing_type_names = [
  "サビキ釣り",
  "穴釣り",
  "投げ釣り",
  "渓流釣り",
  "ルアー釣り",
  "バス釣り",
]
fishing_types = fishing_type_names.map { |fishing_type_name| FishingType.new(name: fishing_type_name) }
FishingType.import fishing_types
