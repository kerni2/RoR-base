class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'

  scope :easy_test, -> { where(level: 0..1) }
  scope :middle_test, -> { where(level: 2..4) }
  scope :hard_test, -> { where(level: 5..Float::INFINITY) }

  scope :category_name, -> (name) { joins(:category).where(category: { title: name }) }
  scope :sort_title, -> { order(title: 'DESC') }

  scope :visible, -> { where(visible: true) }
  scope :test_on_category, -> (category) {joins(:category).where(categories: { title: category })}

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :level_value

  def self.category_sort(name)
    Test.category_name(name).sort_title.pluck('title')
  end

  def deadline_time
    self.timing*60
  end

  private

  def level_value
    errors.add(:test, "Level must be in (1,2,3) range") unless [1,2,3].include? self.level
  end

end
