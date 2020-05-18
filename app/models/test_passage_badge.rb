# frozen_string_literal: true

class TestPassageBadge < ApplicationRecord
  belongs_to :test_passage
  belongs_to :badge
end
