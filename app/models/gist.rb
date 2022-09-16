class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def question_title
    self.question.body.truncate(25)
  end

  def hash_title
    self.url.split('/').last
  end
end
