# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  { title: "Frontend" },
  { title: "Backend" },
  { title: "Mobile" }
])

user = User.create(password: "3213123", email: "123@asd.123")
admin = User.create(password: "123123", email: "admin@testguru.com", type: "Admin", first_name: "Danil", last_name: "Antoshin")

tests = user.tests.create!([
  { title: "Основы Ruby", level: 1, category_id: categories[1].id, author_id: admin.id },
  { title: "HTML", level: 0, category_id: categories[0].id, author_id: admin.id },
  { title: "CSS", level: 0, category_id: categories[0].id, author_id: admin.id },
  { title: "Основы Rails", level: 1, category_id: categories[1].id, author_id: admin.id },
  { title: "Продвинутый Rails", level: 2, category_id: categories[1].id, author_id: admin.id },

])

questions = Question.create([
  { body: "Что такое div?", test_id: tests[0].id },
  { body: "Что такое module?", test_id: tests[1].id }
])

answers = Answer.create([
  { body: "Тэг", correct: true, question_id: questions[0].id },
  { body: "Метод", correct: false, question_id: questions[0].id },
  { body: "Класс", correct: false, question_id: questions[0].id },
  { body: "Модуль", correct: false, question_id: questions[0].id },
])
