class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.tests_by_category (category_title)
    Test.joins(:category)
        .where("categories.title" => category_title)
        .order(title: :desc)
  end
end