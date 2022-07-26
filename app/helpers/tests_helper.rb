module TestsHelper

  def test_level(test)
    case test.level
    when 0..1
      'easy'
    when 2..4
      'middle'
    else
      'hard'
    end
  end

  def test_count_questions(test)
    test.questions.count
  end
end
