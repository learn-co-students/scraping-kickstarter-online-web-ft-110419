# require libraries/modules here
require "nokogiri"
require "pry"
def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = kickstarter.css("li.project.grid_4")
  titles = projects.css(".project-card .bbcard_name strong a")
  titles_text = titles.map{|title| title.text}
  images = projects.css("div.project-thumbnail a img").attribute("src").value
  percent_funded = projects.css("ul.project-stats li.first.funded strong")
  percents = percent_funded.map{|percent| percent.text.gsub("%", "").to_i}
  blurbs = projects.css("p.bbcard_blurb")
  description = blurbs.map {|blurb| blurb.text.strip}
  locations = projects.css("span.location-name")
  locations_text = locations.map {|location| location.text}
  
  project_hash = {}
  projects.each_with_index do |project,index| 
     title = titles_text[index].to_sym
     project_hash[title] = {}
     project_hash[title][:percent_funded] = percents[index]
     project_hash[title][:location] = locations_text[index]
     project_hash[title][:description] = description[index]
     project_hash[title][:image_link] = images
  end
  project_hash
end



create_project_hash
