# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read("fixtures/kickstarter.html")
  doc = Nokogiri::HTML(html)
  project_list = doc.css("#projects_list > li")
  
  project_list.each_with_object({}) do |project,h|  
      title = project.css("h2 a").text
        h[title] = {
          :image_link = project.css(".projectphoto-little")[0].values[-2],
          :description = project.css(".bbcard_blurb").text,
          :location = project.css(".location-name").text,
          :percent_funded = project.css(".first.funded").text
        }
  end
# binding.pry
end
