class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validation_count_answers

  private

  def validation_count_answers
    errors.add(:base, 'Count answers must be less then 4') if question.answers.count > 3
  end
end
