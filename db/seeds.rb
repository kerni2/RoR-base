# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'user1@mail.com', password: '111111')
user2 = User.create(email: 'user2@mail.com', password: '222222')
user3 = Admin.create(email: 'user3@mail.com', password: '333333')

python = Category.create(title: 'Python')
ruby = Category.create(title: 'Ruby')
web = Category.create(title: 'Web')

test_ruby = ruby.tests.create(title: 'Ruby', level: 1, author: user1)
test_web = web.tests.create(title: 'Web', author: user1)
test_python = python.tests.create(title: 'Python', level: 1, author: user1)

ruby_question1 = test_ruby.questions.create!(body: 'В каком варианте вы получите число без пропуска строки от пользователя:', test_id: test_ruby.id)

ruby_question1_answer1 = ruby_question1.answers.create(body: 'num = gets. to_i', question_id: ruby_question1.id)
ruby_question1_answer2 = ruby_question1.answers.create(body: 'num = gets. chomp()', question_id: ruby_question1.id)
ruby_question1_answer3 = ruby_question1.answers.create(body: 'num = gets. chomp(). to_i', correct: true, question_id: ruby_question1.id)

ruby_question2 = test_ruby.questions.create!(body: 'Как называется самый популярный фреймворк Ruby для веба:', test_id: test_ruby.id)

ruby_question2_answer1 = ruby_question2.answers.create(body: 'Ruby Web', question_id: ruby_question2.id)
ruby_question2_answer2 = ruby_question2.answers.create(body: 'Ruby Framework', question_id: ruby_question2.id)
ruby_question2_answer3 = ruby_question2.answers.create(body: 'Ruby On Rails', correct: true, question_id: ruby_question2.id)

web_question1 = test_web.questions.create!(body: 'Каким тегом задается метка на web-странице?', test_id: test_web.id)

web_question1_answer1 = web_question1.answers.create(body: '<font color="..."> </font>', question_id: web_question1.id)
web_question1_answer2 = web_question1.answers.create(body: '<a href="..."> </a>', question_id: web_question1.id)
web_question1_answer3 = web_question1.answers.create(body: '<a name="..."></a>', correct: true, question_id: web_question1.id)

web_question2 = test_web.questions.create!(body: 'Каким тегом объявляется web-страница?', test_id: test_web.id)

web_question2_answer1 = web_question2.answers.create(body: '<head> </head>', question_id: web_question2.id)
web_question2_answer2 = web_question2.answers.create(body: '<body> </body>', question_id: web_question2.id)
web_question2_answer3 = web_question2.answers.create(body: '<html> </html>', correct: true, question_id: web_question2.id)

python_question1 = test_python.questions.create!(body: 'Какая из следующих функций преобразует одиночный символ в его целочисленный эквивалент в Python?', test_id: test_python.id)

python_question1_answer1 = python_question1.answers.create(body: 'unichr(x)', question_id: python_question1.id)
python_question1_answer2 = python_question1.answers.create(body: 'oct(x)', question_id: python_question1.id)
python_question1_answer3 = python_question1.answers.create(body: 'ord(x)', correct: true, question_id: python_question1.id)

python_question2 = test_python.questions.create!(body: 'Какая из следующих функций используется для проверки, все ли символы в строке находятся в нижнем регистре?', test_id: test_python.id)

python_question2_answer1 = python_question2.answers.create(body: 'isspace()', question_id: python_question2.id)
python_question2_answer2 = python_question2.answers.create(body: 'istitle()', question_id: python_question2.id)
python_question2_answer3 = python_question2.answers.create(body: 'islower()', correct: true, question_id: python_question2.id)

test_ruby.users.push(user1)
test_web.users.push(user1)
test_python.users.push(user1)
