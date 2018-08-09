class Response < ApplicationRecord
  validate :not_duplicate_response, :not_author_response

  belongs_to :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(id: respondent.id)
  end


  def respondent_is_author?
    self.poll.author.id == respondent.id
  end

  private
  def not_duplicate_response
    if respondent_already_answered?
      raise 'respondent already answered!'
    end
  end

  def not_author_response
    if respondent_is_author?
      raise 'respondent is author!!!!'
    end
  end

end
