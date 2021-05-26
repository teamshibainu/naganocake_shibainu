# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@icloud.com',
  password: "aaaaaa"
)

Genre.create!(
    name: "ケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )
Genre.create!(
    name: "プリン",
    is_valid: [['有効', true], ['無効', false]]
  )
Genre.create!(
    name: "焼き菓子",
    is_valid: [['有効', true], ['無効', false]]
  )
Genre.create!(
    name: "キャンディ",
    is_valid: [['有効', true], ['無効', false]]
  )
Genre.create!(
    name: "チョコケーキ",
    is_valid: [['有効', true], ['無効', false]]
  )

Product.create!(
    name: "ショートケーキ",
    description: "シンプルなショートケーキです。",
    price: "500",
    genre_id: 1,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/ショートケーキ.jpeg")
)

Product.create!(
    name: "柴犬ショートケーキ",
    description: "可愛い柴犬のチョコレートがのっているショートケーキです。",
    price: "700",
    genre_id: 1,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_cake1.jpg")
)

Product.create!(
    name: "柴犬ショートケーキ(ホール)",
    description: "クリームで作られた柴犬がのっているショートケーキです。",
    price: "2000",
    genre_id: 1,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_cake2.jpg")
)

Product.create!(
    name: "チョコレートケーキ",
    description: "シンプルなチョコレートケーキです。",
    price: "500",
    genre_id: 5,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/chocolatecake.jpg")
)

Product.create!(
    name: "柴犬チョコレートケーキ",
    description: "柴犬の顔をしたチョコレートケーキです。✕犬にあげてはいけません",
    price: "700",
    genre_id: 5,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_chocolatecake1.jpg")
)

Product.create!(
    name: "柴犬チョコレートロールケーキ",
    description: "柴犬の顔をしたチョコレートロールケーキです。✕犬にあげてはいけません",
    price: "1000",
    genre_id: 5,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_chocolatecake2.jpg")
)

Product.create!(
    name: "柴犬プリン",
    description: "柴犬の容器に入ったプリンです。",
    price: "300",
    genre_id: 2,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_pudding.jpg")
)

Product.create!(
    name: "柴犬クッキー",
    description: "柴犬の形をしたクッキーです。",
    price: "200",
    genre_id: 3,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_cookie1.jpg")
)

Product.create!(
    name: "柴犬キャンディ",
    description: "柴犬の形をしたキャンディです。",
    price: "200",
    genre_id: 4,
    sale_status: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/shiba_candy1.jpg")
)


