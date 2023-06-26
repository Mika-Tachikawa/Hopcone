users = User.create!(
  [
    {email: 'olivia@example.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@example.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@example.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

PostImage.create!(
  [
    {shop_name: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '大人気のカフェです。', user_id: users[0].id },
    {shop_name: '和食屋せん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '日本料理は美しい！', user_id: users[1].id },
    {shop_name: 'ShoreditchBar', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'メキシコ料理好きな方にオススメ！', user_id: users[2].id }
  ]
)

#ここから上は後で消す




#画像の修正要
users = User.create!(
  [
    {email: 'ajillo@beer.com', name: 'Ajillo', password: 'userpass', introduction: 'アヒージョ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ajillo.jpg"), filename:"ajillo.jpg")},
    {email: 'itawasa@beer.com', name: '板わさ', password: 'userpass', introduction: 'かまぼこ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/itawasa.jpg"), filename:"itawasa.jpg")},
    {email: 'umeboshi@beer.com', name: 'Umeboshi', password: 'userpass', introduction: 'うめぼし', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ume.jpg"), filename:"ume.jpg")},
    {email: 'edamame@beer.com', name: '枝豆', password: 'userpass', introduction: 'えだまめ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/edamame.jpg"), filename:"edamame.jpg")},
    {email: 'oden@beer.com', name: 'おでん', password: 'userpass', introduction: 'おでん', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/oden.jpg"), filename:"oden.jpg")},
    {email: 'karaage@beer.com', name: 'Karaage', password: 'userpass', introduction: 'からあげ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/karaage.jpg"), filename:"karaage.jpg")},
    {email: 'kimuchi@beer.com', name: 'キムチ', password: 'userpass', introduction: 'キムチ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kimuchi.jpg"), filename:"kimuchi.jpg")},
  ]
)

Admin.create!(
  [
    {email: 'admin@beer.com', password: 'adminpass'},
  ]
)



Review.create!(
  [
    {name: '水曜日のネコ', brewery: 'ヤッホーブルーイング', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '山梨にあるブルワリーの、クラフトビール。爽やかで、フルーティーな香り。',  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample1-neko.jpg"), filename:"sample1-neko.jpg"), user_id: users[0].id },
    {name: 'インドの青鬼', brewery: 'ヤッホーブルーイング', location: 'スーパー', hoppy: '5', acidity: '2', sweetness: '0', comment: '山梨にあるブルワリーの、クラフトビール。苦味が強く、ガツンとくる味。',  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample2-oni.jpg"), filename:"sample2-oni.jpg"), user_id: users[6].id },
    {name: 'アサヒスーパードライ', brewery: 'アサヒビール株式会社', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '後味さっぱりめ。若干、酸味よりも苦味を多く感じる',  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample3-asahi.jpg"), filename:"sample3-asahi.jpg"), user_id: users[1].id },
    {name: 'キリン一番搾り生ビール', brewery: 'キリンホールディングス株式会社', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '後味に苦味がある。夏やお風呂上がりにさっぱりと飲める。',  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample4-kirin.jpg"), filename:"sample4-kirin.jpg"), user_id: users[1].id },
    {name: 'ヱビスビール', brewery: 'サッポロビール株式会社', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '苦味と酸味のバランスがよい。',  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample5-yebisu.jpg"), filename:"sample5-yebisu.jpg"), user_id: users[4].id },
    {name: 'AHM', brewery: 'West Coast Brewing', location: 'BEER VOLTA(通販）', hoppy: '5', acidity: '2', sweetness: '3', comment: 'ホップの「モザイク」というが使われていて、その風味がよく出てる。Full Hop Alchemistシリーズをまろやかしたような感じ。',  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample6-ahm.jpg"), filename:"sample6-ahm.jpg"), user_id: users[5].id },
  ]
)