class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :progresses
  has_many :users, through: :progresses
  belongs_to :author, class_name: :User, foreign_key: :author_id

  def self.category_name(name)
    Test.joins(:category).where(category: { title: name }).order(title: 'DESC').pluck('title')
  end
end
