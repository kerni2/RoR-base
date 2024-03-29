module TestsHelper

  TEST_LEVELS = {1 => :easy, 2 => :middle, 3=> :hard}.freeze

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

  def format_time(time)
    minutes = ((time % 3600) / 60).to_i
    seconds = ((time % 3600) % 60).to_i
    "#{sprintf '%02d', minutes}:#{sprintf '%02d', seconds}"
  end

end
