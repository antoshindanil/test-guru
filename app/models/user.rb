class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def passed_tests (level)
    Test.where(level: level)
  end
end
