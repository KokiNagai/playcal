module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def other_user
    @other_user ||= User.where.not(id: current_user.id)
  end

  def full_title(page_title)
    base_title = "Playcal.jp"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def default_meta_tags
    {
      site: 'Playcal',
      sitename: 'Playcal',
      title: '「シンプルですばやく」テニスの練習相手がここで見つかる',
      reverse: true,
      charset: 'utf-8',
      description: 'Playcalは「シンプルですばやく」テニスの練習相手を見つけることができます',
      keywords: 'テニス, オフ会, 仲間, 練習相手, ダブルス',
      noindex: ! Rails.env.production?,
      canonical: request.original_url,
      separator: '-',
      og: {
        site_name: 'Playcal',
        title: '「シンプルですばやく」テニスの練習相手がここで見つかる',
        description: 'Playcalは「シンプルですばやく」テニスの練習相手を見つけることができます',
        image: image_url("https://cdn.pixabay.com/photo/2016/04/01/08/31/tennis-1298769_1280.png"),
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@playcal_tennis',
      }
    }
  end

end
