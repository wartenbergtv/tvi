# https://www.youtube.com/watch?v=C68n2Wy61pI

FactoryBot.create :setting

FactoryBot.create :user, email: "joe@test.com", password: "test123", password_confirmation: "test123"
FactoryBot.create :user, :admin, email: "admin@test.com", password: "test123", password_confirmation: "test123"

FactoryBot.create :episode, published_on: 1.day.ago, number: 1, title: "Rettet die (Strogen-)Biene",
                            youtube_key: "C68n2Wy61pIg"
