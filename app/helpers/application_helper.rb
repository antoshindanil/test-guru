# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_link(repository, name)
    link_to "Github", "https://github.com/#{repository}/#{name}", target: "_blank"
  end
end
