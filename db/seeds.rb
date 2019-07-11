10.times do
  Post.create title: FFaker::Lorem.sentence, content: FFaker::Lorem.paragraphs.join
end
