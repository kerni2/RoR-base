# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'user1', type_user: 'user')
user2 = User.create(name: 'user2', type_user: 'user')
user3 = User.create(name: 'user3', type_user: 'user')

python = Category.create(title: 'Python')
ruby = Category.create(title: 'Ruby')
web = Category.create(title: 'Web')

test_ruby = Test.create(title: 'Ruby', level: 1, category_id: ruby.id, author_id: user1.id)
test_web = Test.create(title: 'Web', category_id: web.id, author_id: user1.id)
test_python = Test.create(title: 'Python', level: 1, category_id: python.id, author_id: user1.id)

ruby_question1 = Question.create(body: 'В каком варианте вы получите число без пропуска строки от пользователя:', test_id: test_ruby.id)

ruby_question1_answer1 = Answer.create(body: 'num = gets. to_i', question_id: ruby_question1.id)
ruby_question1_answer2 = Answer.create(body: 'num = gets. chomp()', question_id: ruby_question1.id)
ruby_question1_answer3 = Answer.create(body: 'num = gets. chomp(). to_i', correct: true, question_id: ruby_question1.id)

ruby_question2 = Question.create(body: 'Как называется самый популярный фреймворк Ruby для веба:', test_id: test_ruby.id)

ruby_question2_answer1 = Answer.create(body: 'Ruby Web', question_id: ruby_question2.id)
ruby_question2_answer2 = Answer.create(body: 'Ruby Framework', question_id: ruby_question2.id)
ruby_question2_answer3 = Answer.create(body: 'Ruby On Rails', correct: true, question_id: ruby_question2.id)

web_question1 = Question.create(body: 'Каким тегом задается метка на web-странице?', test_id: test_web.id)

web_question1_answer1 = Answer.create(body: '<font color="..."> </font>', question_id: web_question1.id)
web_question1_answer2 = Answer.create(body: '<a href="..."> </a>', question_id: web_question1.id)
web_question1_answer3 = Answer.create(body: '<a name="..."></a>', correct: true, question_id: web_question1.id)

web_question2 = Question.create(body: 'Каким тегом объявляется web-страница?', test_id: test_web.id)

web_question2_answer1 = Answer.create(body: '<head> </head>', question_id: web_question2.id)
web_question2_answer2 = Answer.create(body: '<body> </body>', question_id: web_question2.id)
web_question2_answer3 = Answer.create(body: '<html> </html>', correct: true, question_id: web_question2.id)

python_question1 = Question.create(body: 'Какая из следующих функций преобразует одиночный символ в его целочисленный эквивалент в Python?', test_id: test_python.id)

python_question1_answer1 = Answer.create(body: 'unichr(x)', question_id: python_question1.id)
python_question1_answer2 = Answer.create(body: 'oct(x)', question_id: python_question1.id)
python_question1_answer3 = Answer.create(body: 'ord(x)', correct: true, question_id: python_question1.id)

python_question2 = Question.create(body: 'Какая из следующих функций используется для проверки, все ли символы в строке находятся в нижнем регистре?', test_id: test_python.id)

python_question2_answer1 = Answer.create(body: 'isspace()', question_id: python_question2.id)
python_question2_answer2 = Answer.create(body: 'istitle()', question_id: python_question2.id)
python_question2_answer3 = Answer.create(body: 'islower()', correct: true, question_id: python_question2.id)

Progress.create(user_id: user1.id, test_id: test_ruby.id)
Progress.create(user_id: user1.id, test_id: test_web.id)
Progress.create(user_id: user2.id, test_id: test_web.id)
Progress.create(user_id: user3.id, test_id: test_python.id)
