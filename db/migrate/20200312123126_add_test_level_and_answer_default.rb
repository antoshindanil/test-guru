# frozen_string_literal: true

class AddTestLevelAndAnswerDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, false)
  end
end
