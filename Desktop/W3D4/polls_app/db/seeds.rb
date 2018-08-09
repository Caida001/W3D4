# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#USERS
User.create(username: 'Caida')
User.create(username: 'Dan')
User.create(username: 'Olivia')
User.create(username: 'Ruby')
User.create(username: 'Emily')
User.create(username: 'Grace')
User.create(username: 'Chloe')
User.create(username: 'Sophie')
User.create(username: 'Lily')
User.create(username: 'Amelia')


Poll.create(author: User.first, title: 'poll1')
Poll.create(author: User.last, title: 'poll2')
Poll.create(author: User.third, title: 'poll3')

Question.create(text: 'question1', poll: Poll.first)
Question.create(text: 'question2', poll: Poll.first)
Question.create(text: 'question3', poll: Poll.second)
Question.create(text: 'question4', poll: Poll.third)
Question.create(text: 'question5', poll: Poll.third)
Question.create(text: 'question6', poll: Poll.third)


AnswerChoice.create(text: 'choice1', question: Question.first)
AnswerChoice.create(text: 'choice2', question: Question.first)
AnswerChoice.create(text: 'choice3', question: Question.first)
AnswerChoice.create(text: 'choice4', question: Question.second)
AnswerChoice.create(text: 'choice5', question: Question.third)
AnswerChoice.create(text: 'choice6', question: Question.third)
AnswerChoice.create(text: 'choice7', question: Question.fourth)
AnswerChoice.create(text: 'choice8', question: Question.fifth)
AnswerChoice.create(text: 'choice9', question: Question.last)
AnswerChoice.create(text: 'choice10', question: Question.last)


Response.create(answer_choice: AnswerChoice.first, respondent: User.first)
Response.create(answer_choice: AnswerChoice.first, respondent: User.second)
Response.create(answer_choice: AnswerChoice.third, respondent: User.third)
Response.create(answer_choice: AnswerChoice.fifth, respondent: User.fourth)
Response.create(answer_choice: AnswerChoice.last, respondent: User.fifth)
Response.create(answer_choice: AnswerChoice.second, respondent: User.last)
