class User < ApplicationRecord
  def difficulty(level)
    Test.joins('JOIN progresses ON tests.id = progresses.test_id').where('progresses.user_id = ? AND tests.level = ?', self.id, level)
  end
end
