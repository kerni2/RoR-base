class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id, optional: true

  before_validation :before_validation_set_question, on: [:create, :update]

  SUCCESS_VALUE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def current_question_num
    return test_questions_order.index(current_question) + 1 if current_question.present?
  end

  def questions_total_number
    test.questions.count
  end

  def passage_success?
    rate_of_completed_questions >= SUCCESS_VALUE
  end

  def rate_of_completed_questions
    count = questions_total_number
    result = count.zero? ? 0 : (correct_questions * 100 / count)
  end

  private

  def before_validation_set_question
    self.current_question = (self.current_question.nil? ? test_questions_order.first : next_question)
  end

  def test_questions_order
    self.test.questions.order(:id)
  end

  def correct_answer?(answer_ids)
    answer_ids.present? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
