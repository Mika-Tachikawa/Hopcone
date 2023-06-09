p '==================== user_account create ===================='
3.times do |n|
	User.create!(
		name: "Aoi",
		email: "aoi@gmail.com",
		introduction: "趣味はビアバーめぐりです。",
    password: "123456",
		is_deleted: false
		)
end

p '==================== admin create ===================='
3.times do |n|
	Admin.create!(
	  email: "admin@gmail.com", 
	  password: "123456"
	  )
end


p '==================== tag create ===================='
Tag.create!(name: "Acai")
Tag.create!(name: "Acetaldehyde")
Tag.create!(name: "Acidic")


p '==================== review create ===================='
Review.create!(
	user_id: 5,
	name: "インドの青鬼",
	brewery: "ヤッホーブルーイング",
	location: "コンビニ",
	hoppy: 4,
	acidity: 1,
	sweetness: 0,
	evaluation: 3.75,
	comment: "苦ぇーーーー",
)
