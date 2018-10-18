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
      title: '「シンプルで楽しく」テニスの練習相手や仲間がここで見つかる',
      reverse: true,
      charset: 'utf-8',
      description: 'Playcalは「シンプルで楽しく」テニス仲間や練習相手を見つけることができます',
      keywords: 'テニス, テニス仲間, 練習相手, ダブルス, オフ会, playcal, 掲示板, テニス友達, コミュニティ',
      canonical: request.original_url,
      separator: '-',
      og: {
        site_name: 'Playcal',
        title: '「シンプルで楽しく」テニス仲間や練習相手がここで見つかる',
        description: 'Playcalは「シンプルですばやく」テニスの練習相手を見つけることができます',
        image: image_url("https://fedexkoki.com/wp-content/uploads/2018/10/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2018-10-13-12.33.54.png"),
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@playcal_official',
      }
    }
  end

end
