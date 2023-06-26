users = User.create!(
  [
    {email: 'ajillo@beer.com', name: 'Ajillo', password: 'userpass', introduction: 'アヒージョ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ajillo.jpg"), filename:"ajillo.jpg")},
    {email: 'itawasa@beer.com', name: '板わさ', password: 'userpass', introduction: 'かまぼこ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/itawasa.jpg"), filename:"itawasa.jpg")},
    {email: 'umeboshi@beer.com', name: 'Umeboshi', password: 'userpass', introduction: 'うめぼし', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ume.jpg"), filename:"ume.jpg")},
    {email: 'edamame@beer.com', name: '枝豆', password: 'userpass', introduction: 'えだまめ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/edamame.jpg"), filename:"edamame.jpg")},
    {email: 'oden@beer.com', name: 'おでん', password: 'userpass', introduction: 'おでん', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/oden.jpg"), filename:"oden.jpg")},
    {email: 'karaage@beer.com', name: 'Karaage', password: 'userpass', introduction: 'からあげ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/karaage.jpg"), filename:"karaage.jpg")},
    {email: 'kimuchi@beer.com', name: 'キムチ', password: 'userpass', introduction: 'キムチ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kimuchi.jpg"), filename:"kimuchi.jpg")}
  ]
)

Review.create!(
  [
    {name: '水曜日のネコ', brewery: 'ヤッホーブルーイング', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '山梨にあるブルワリーの、クラフトビール。爽やかで、フルーティーな香り。', user_id: users[0].id },
    {name: 'インドの青鬼', brewery: 'ヤッホーブルーイング', location: 'スーパー', hoppy: '5', acidity: '2', sweetness: '0', comment: '山梨にあるブルワリーの、クラフトビール。苦味が強く、ガツンとくる味。', user_id: users[6].id },
    {name: 'アサヒスーパードライ', brewery: 'アサヒビール株式会社', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '後味さっぱりめ。若干、酸味よりも苦味を多く感じる', user_id: users[1].id },
    {name: 'キリン一番搾り生ビール', brewery: 'キリンホールディングス株式会社', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '後味に苦味がある。夏やお風呂上がりにさっぱりと飲める。', user_id: users[1].id },
    {name: 'ヱビスビール', brewery: 'サッポロビール株式会社', location: 'スーパー', hoppy: '2', acidity: '2', sweetness: '0', comment: '苦味と酸味のバランスがよい。', user_id: users[4].id },
    {name: 'AHM', brewery: 'West Coast Brewing', location: 'クラフトビール通販サイト', hoppy: '5', acidity: '2', sweetness: '3', comment: 'ホップの「モザイク」という種類が使われていて、その風味がよく出てる。Full Hop Alchemistシリーズをまろやかしたような感じ。', user_id: users[5].id },
    {name: 'Glamoro', brewery: 'Monkish Brewing', location: 'クラフトビール通販サイト', hoppy: '3', acidity: '1', sweetness: '3', comment: '口当たりがかなり滑らか。グラッシーさ（草っぽい感じ）はほぼなく飲みやすい。濃厚なホップ感が広がる。モンキッシュは、世界最高峰のヘイジーIPAを作るブルワリー。', user_id: users[5].id },
    {name: '三銃士 スタンダード', brewery: '京都醸造 × Bottle Logic Brewing', location: 'クラフトビール通販サイト', hoppy: '８', acidity: '2', sweetness: '7', comment: 'インペリアルスタウトという種類。ウイスキー樽で27ヶ月熟成させた、濃厚なビール。ウイスキーの香りとカカオ、コーヒーの風味が劇的に広がる。', user_id: users[3].id },
    {name: 'Tefnut (Creamsicle Berry Swirl)', brewery: 'The Veil Brewing × Omnipollo', location: 'Antenna America YOKOHAMA(ビアバー)', hoppy: '2', acidity: '8', sweetness: '6', comment: 'まさにベリースムージーを飲んでるような感じ。濃厚なベリーとヨーグルトのような酸味、微かなバニラ感がある。', user_id: users[2].id },    
    {name: 'Everything Banana', brewery: 'Kings Brewing', location: 'クラフトビール通販サイト', hoppy: '1', acidity: '2', sweetness: '9', comment: 'ピーナッツバターが香る濃厚なバナナミルクジュース（ビールの説明か？）。', user_id: users[2].id },
    {name: 'Dark Lab Series 02', brewery: 'West Coast Brewing', location: 'クラフトビール通販サイト', hoppy: '5', acidity: '1', sweetness: '9', comment: '滅茶苦茶濃厚だが、甘みはそこまで強くない。しかし、この濃厚さで、アルコール度数15％のパイント缶（500ml）は狂気。ベロベロに酔う。', user_id: users[3].id },
    {name: 'Limit Break 4 -Citra-', brewery: 'うちゅうブルーイング', location: 'クラフトビール通販サイト', hoppy: '9', acidity: '1', sweetness: '8', comment: 'ヘイジーIPAという種類。ヘイジーIPAで、通常限界とされるホップの量の、数倍ものホップを入れて作ってある。柑橘や桃の風味の後に、シトラというホップの香りがじっとり残る。', user_id: users[5].id },
    {name: 'Airtight', brewery: 'Garage Beer × 3 Sons Brewing', location: 'クラフトビール通販サイト', hoppy: '5', acidity: '2', sweetness: '9', comment: '濃厚なチョコとナッツの甘み、後ろにベリーと栗の風味が隠れている。', user_id: users[3].id },
    {name: 'Candy Baa - Blueberry, Cranberry, Chocolate & Pistachio', brewery: 'Baa Baa Brewhouse', location: 'クラフトビール通販サイト', hoppy: '1', acidity: '6', sweetness: '9', comment: '見た目に反して、アロマ（香り）はピスタチオが直球でくる。飲むとチョコレートの味が追加されて、最後にベリー感が来る。', user_id: users[2].id },
    {name: '那由多 10^60', brewery: 'Horseheads Labs', location: 'クラフトビール通販サイト', hoppy: '9', acidity: '2', sweetness: '2', comment: 'だいぶグラッシー（草っぽい感じ）で、後味に苦味がじんわり残る。', user_id: users[5].id },
    {name: 'DDHSSR', brewery: 'West Coast Brewing', location: 'クラフトビール通販サイト', hoppy: '8', acidity: '4', sweetness: '5', comment: 'トロピカルな柑橘の風味。ダンク(奥行きのある甘い香り)で微かにグラッシー(草っぽい感じ)。', user_id: users[5].id },
    {name: 'Fruits Monster Mango', brewery: 'West Coast Brewing', location: 'クラフトビール通販サイト', hoppy: '4', acidity: '4', sweetness: '5', comment: '文字通りマンゴーミルクシェイク。でも、モルトとホップも調和が取れており、ちゃんとIPAという種類のビールの味になっている。', user_id: users[2].id },
    {name: 'ねこさんびき 温泉ver', brewery: '伊勢角屋麦酒', location: 'クラフトビール通販サイト', hoppy: '5', acidity: '2', sweetness: '5', comment: 'ゴリゴリにホップが効いているが、オーツクリームのお陰で口当たりはとても滑らか。', user_id: users[2].id },
    {name: 'Barrel-Aged Sippin Into Darkness', brewery: 'Hoppin Frog Brewery', location: 'セブンイレブン 横浜ハンマーヘッド店', hoppy: '5', acidity: '3', sweetness: '6', comment: '濃厚なチョコレートとコーヒー、バーボンの風味が丁度良い。', user_id: users[3].id }
  ]
)
