module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Port-Share'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def seeds_image(technique)
    "https://res.cloudinary.com/hqyupfdfe/image/upload/v1623534062/seed-images/#{technique}"
  end

  def seeds_description(technique)
    "#{technique}を使用したアプリを作りました。"
  end
end
