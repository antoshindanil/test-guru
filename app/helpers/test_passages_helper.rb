# frozen_string_literal: true

module TestPassagesHelper
  def colored_result(color, word)
    "<h1 style='color: #{color}'>
      Test #{@test_passage.test.title} #{word}
    </h1>
    <br>
    <b>
      #{@test_passage.current_questions_percent.to_i} % correct questions
    </b>".html_safe
  end
end
