Before do
  @login_page = LoginPage.new
  @movie_page = MoviePage.new
  @sidebar = SideBarView.new
end

Before("@login") do
  @login_page.go
  @login_page.with("tony@stark.com", "123456")
end

After do |scenario|
  # if scenario.failed?
  shot_file = page.save_screenshot("log/screenshot.png")
  shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
  embed(shot_b64, "image/png", "Screenshot") # Cucumber anexa o screenshot no report
  # end
end