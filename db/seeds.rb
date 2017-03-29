require 'random_data'

15.times do
    Topic.create!(
        name:        RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end
topics = Topic.all


#Create Posts
50.times do
    Post.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all

#Create Comments

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

10.times do
    SponsoredPost.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(1..500)
    )
end

puts "Seed Finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"