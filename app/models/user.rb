class User < ApplicationRecord
  has_many :progresses
  has_many :tests, through: :progresses
  has_many :author_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id

  def difficulty(level)
    tests.where(level: level)
  end
end
