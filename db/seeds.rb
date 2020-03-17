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


tests = Test.create([
  { title: "Основы Ruby", level: 1, category_id: categories[1].id },
  { title: "HTML", level: 0, category_id: categories[0].id },
  { title: "CSS", level: 0, category_id: categories[0].id },
  { title: "Основы Rails", level: 1, category_id: categories[1].id },
  { title: "Продвинутый Rails", level: 2, category_id: categories[1].id },

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

answers
