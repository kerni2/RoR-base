module QuestionsHelper
  def question_header(question)
    "#{question.persisted? ? 'Edit' : 'Create new'} #{question.test.title} Question"
  end
end
