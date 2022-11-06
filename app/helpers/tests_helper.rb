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

  def test_category(test)
    test.category.title
  end

  def test_author(test)
    test.author.name
  end

end
