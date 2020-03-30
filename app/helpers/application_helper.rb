module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_link(repository, name)
    link_to repository, "https://github.com/#{repository}/#{name}", target: "_blank"
  end
end
