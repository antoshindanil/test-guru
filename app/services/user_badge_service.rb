# frozen_string_literal: true

class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send(badge.rule_name, badge)
    end
  end

  private
    def category_rule(badge)
      value = badge.value.to_i

      if value == @test.category_id
        @user.passed_tests?(Test.with_questions.where(category_id: value).pluck(:id))
      end
    end

    def first_attempt_rule(badge)
      TestPassage.where(user_id: @user.id, test_id: @test.id).count == 1
    end

    def level_rule(badge)
      value = badge.value.to_i

      if value == @test.level
        @user.passed_tests?(Test.with_questions.where(level: value).pluck(:id))
      end
    end
end
