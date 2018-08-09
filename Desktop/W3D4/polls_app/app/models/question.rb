class Question < ApplicationRecord

  validates :text, presence: true

  belongs_to :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id

  has_many :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    h = Hash.new

    # choices = self.answer_choices.includes(:responses)
    # choices.each do |choice|
    #   h[choice.text] = choice.responses.count
    # end

    result_query = AnswerChoice
      .left_outer_joins(:responses)
      .where('answer_choices.question_id = ?', self.id)
      .group('answer_choices.id')
      .select('answer_choices.text, COUNT(responses.user_id) AS total')

    result_query.each do |choice|
      h[choice.text] = choice.total
    end

    h
  end
end
