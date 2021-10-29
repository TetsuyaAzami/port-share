module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Port-Share'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # cloudinaryから動的に画像を取得する
  def seeds_image(technique)
    "https://res.cloudinary.com/hqyupfdfe/image/upload/v1623534062/seed-images/#{technique}"
  end

  # ランダムに選ばれたtechniqueに応じて動的に説明文を変える
  def seeds_description(technique)
    "#{technique}を使用したアプリを作りました。"
  end
end
