# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all
Watch.delete_all

list = ['ruby', 'rails', 'javascript', 'angular', 'jquery', 'html', 'css', 'bootstrap', 'foundation', 'sinatra', 'ajax', 'array', 'hash', 'string', 'function', 'method', 'json', 'associations', 'model', 'controller', 'scope', 'promises', 'osx', 'terminal', 'console', 'rake tasks', 'git', 'github', 'heroku', 'seed', 'gems']

list.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
end

u1 = User.create(first_name: 'Colin', last_name: 'Durbin', email: 'colin@gmail.com', location: 'London, UK', ga_course: 'wdi', role: 'Student', graduated_date: 'current student', password: 'password', image: 'https://s3-eu-west-1.amazonaws.com/wdi11-final-project/images/social_profile_photo_01_200x200.jpg')

u2 = User.create(first_name: 'Becky', last_name: 'Smith', email: 'becky@gmail.com', location: 'New York City, USA', ga_course: 'uxdi', role: 'Instuctor', password: 'password', image: 'https://s3-eu-west-1.amazonaws.com/wdi11-final-project/images/user_default_pic.gif')

u3 = User.create(first_name: 'Alan', last_name: 'Truffala', email: 'alan@gmail.com', location: 'San Francisco, USA', ga_course: 'wdi', role: 'Student', password: 'password', image: 'https://s3-eu-west-1.amazonaws.com/wdi11-final-project/images/user_default_pic2.png')

q1 = Question.create(title: 'How do I create seed data in rails?', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque tempore, nam beatae provident illo nobis optio ad, nulla neque incidunt eos obcaecati deleniti placeat voluptates laboriosam alias dolor temporibus natus.', viewed: 5, user_id: u1.id, tag_list: 'ruby, rails, javascript')

q2 = Question.create(title: 'Seed multiple rows at once laravel 5?', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque tempore, nam beatae provident illo nobis optio ad, nulla neque incidunt eos obcaecati deleniti placeat voluptates laboriosam alias dolor temporibus natus.', viewed: 18, user_id: u2.id, tag_list: 'ruby, javascript, seed')

q3 = Question.create(title: 'jQuery slideshow … how to add text from alt tag?', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque tempore, nam beatae provident illo nobis optio ad, nulla neque incidunt eos obcaecati deleniti placeat voluptates laboriosam alias dolor temporibus natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, quod obcaecati animi autem reiciendis placeat, enim accusantium incidunt voluptas doloribus quaerat natus reprehenderit aperiam, expedita architecto quam mollitia nostrum explicabo!', viewed: 12, user_id: u3.id, tag_list: 'angular, rails, jquery')

q4 = Question.create(title: 'How do I make sure that gems get installed in the correct location?', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque tempore, nam beatae provident illo nobis optio ad, nulla neque incidunt eos obcaecati deleniti placeat voluptates laboriosam alias dolor temporibus natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit.', viewed: 3, user_id: u1.id, tag_list: 'ruby, rails, gems')

q5 = Question.create(title: 'How do I write a JavaScript function that returns a google.maps.LatLng of the current location?
', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque tempore, nam beatae provident illo nobis optio ad, nulla neque incidunt eos obcaecati deleniti placeat voluptates laboriosam alias dolor temporibus natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, quod obcaecati animi autem reiciendis placeat, enim accusantium incidunt voluptas doloribus quaerat natus reprehenderit aperiam, expedita architecto quam mollitia nostrum explicabo!', viewed: 7, user_id: u2.id, tag_list: 'css, rails, javascript')

a1 = Answer.create(user_id: u2.id, question_id: q1.id, content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus voluptate suscipit, porro enim error odit quis ut odio commodi tempora ab laudantium ducimus perferendis beatae ad a, pariatur explicabo aperiam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam, harum repellat delectus sequi totam optio nostrum, similique dolor maiores unde ipsum asperiores hic soluta dolorem reprehenderit impedit illo possimus. Quisquam.')

a2 = Answer.create(user_id: u3.id, question_id: q1.id, content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus voluptate suscipit, porro enim error odit quis ut odio commodi tempora ab laudantium ducimus perferendis beatae ad a, pariatur explicabo aperiam.')

a3 = Answer.create(user_id: u1.id, question_id: q2.id, content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus voluptate suscipit, porro enim error odit quis ut odio commodi tempora ab laudantium ducimus perferendis beatae ad a, pariatur explicabo aperiam.')

a4 = Answer.create(user_id: u3.id, question_id: q2.id, content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus voluptate suscipit, porro enim error odit quis ut odio commodi tempora ab laudantium ducimus perferendis beatae ad a, pariatur explicabo aperiam.')

a5 = Answer.create(user_id: u1.id, question_id: q3.id, content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus voluptate suscipit, porro enim error odit quis ut odio commodi tempora ab laudantium ducimus perferendis beatae ad a, pariatur explicabo aperiam.')

c1 = Comment.create(user_id: u2.id, commentable_id: q1.id, commentable_type: 'Question', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing el.')

c2 = Comment.create(user_id: u3.id, commentable_id: a1.id, commentable_type: 'Answer', content: 'Lorem ipsum.')

c3 = Comment.create(user_id: u3.id, commentable_id: q1.id, commentable_type: 'Question', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing el.')

c4 = Comment.create(user_id: u2.id, commentable_id: a5.id, commentable_type: 'Answer', content: 'Lorem ipsum.')

v1 = Vote.create(user_id: u1.id, votable_id: q1.id, votable_type: 'Question', score: 1)

v2 = Vote.create(user_id: u1.id, votable_id: q2.id, votable_type: 'Question', score: 1)

v3 = Vote.create(user_id: u1.id, votable_id: q3.id, votable_type: 'Question', score: 1)

v4 = Vote.create(user_id: u2.id, votable_id: q1.id, votable_type: 'Question', score: 1)

v5 = Vote.create(user_id: u2.id, votable_id: q2.id, votable_type: 'Question', score: 1)

v6 = Vote.create(user_id: u2.id, votable_id: q3.id, votable_type: 'Question', score: 1)

v7 = Vote.create(user_id: u3.id, votable_id: a1.id, votable_type: 'Answer', score: 1)

v8 = Vote.create(user_id: u1.id, votable_id: a2.id, votable_type: 'Answer', score: 1)

v9 = Vote.create(user_id: u1.id, votable_id: a3.id, votable_type: 'Answer', score: 1)

v10 = Vote.create(user_id: u3.id, votable_id: a1.id, votable_type: 'Answer', score: 1)

v11 = Vote.create(user_id: u2.id, votable_id: a2.id, votable_type: 'Answer', score: 1)

v12 = Vote.create(user_id: u3.id, votable_id: a3.id, votable_type: 'Answer', score: 1)

v13 = Vote.create(user_id: u2.id, votable_id: q5.id, votable_type: 'Question', score: 1)

v14 = Vote.create(user_id: u2.id, votable_id: q5.id, votable_type: 'Question', score: 1)

v15 = Vote.create(user_id: u2.id, votable_id: q4.id, votable_type: 'Question', score: 1)

w1 = Watch.create(user_id: u1.id, question_id: q1.id)

w2 = Watch.create(user_id: u1.id, question_id: q3.id)

w3 = Watch.create(user_id: u2.id, question_id: q2.id)









