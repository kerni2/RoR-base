class Test < ApplicationRecord
  def self.category_name(name)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', name).order(title: 'DESC').pluck(:title)
  end
end
