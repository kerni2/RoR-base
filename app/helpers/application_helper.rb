module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github(name, repository)
    "https://github.com/#{name}/#{repository}"
  end
end
