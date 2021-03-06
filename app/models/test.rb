class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :progresses
  has_many :users, through: :progresses
  belongs_to :author, class_name: :User, foreign_key: :author_id

  scope :easy_test, -> { where(level: 0..1) }
  scope :middle_test, -> { where(level: 2..4) }
  scope :hard_test, -> { where(level: 5..Float::INFINITY) }

  scope :category_name, -> (name) { joins(:category).where(category: { title: name }) }
  scope :sort_title, -> { order(title: 'DESC') }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.category_sort(name)
    Test.category_name(name).sort_title.pluck('title')
  end

end
