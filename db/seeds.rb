# https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/000-markus-loibl.mp3
# https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/test-001.mp3

FactoryBot.create :user, email: "joe@test.com", password: "test123", password_confirmation: "test123"
FactoryBot.create :user, :admin, email: "admin@test.com", password: "test123", password_confirmation: "test123"
FactoryBot.create :episode, published_on: 1.day.ago, slug: "003-soli",
                            file_url: "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/test-001.mp3"
FactoryBot.create :episode, title: "Markus", published_on: 1.month.ago, slug: "001-markus",
                            file_url: "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/000-markus-loibl.mp3"
