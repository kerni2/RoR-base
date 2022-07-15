class User < ApplicationRecord
  has_many :progresses
  has_many :tests, through: :progresses
  has_many :authors, class_name: :Test, inverse_of: :author, foreign_key: :author_id
  def difficulty(level)
    Test.joins('JOIN progresses ON tests.id = progresses.test_id').where('progresses.user_id = ? AND tests.level = ?', self.id, level)
  end
end
