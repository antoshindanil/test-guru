class User < ApplicationRecord
  def passed_tests (level)
    Test.where(level: level)
  end
end
