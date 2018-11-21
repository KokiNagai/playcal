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
      title: '「シンプルで簡単に」テニスの練習相手や仲間が見つかる',
      reverse: true,
      charset: 'utf-8',
      description: 'テニスをより楽しく、より上手に。テニスのマッチングサービス「Playcal」でテニスの練習相手や仲間を見つけてみませんか？',
      keywords: 'テニス, テニス仲間, 練習相手, マッチング,  オフ会, 掲示板, テニス友達, コミュニティ',
      canonical: request.original_url,
      separator: '-',
      og: {
        site_name: 'Playcal',
        title: '「シンプルで簡単に」テニスの練習相手や仲間が見つかる',
        description: 'テニスをより楽しく、より上手に。テニスのマッチングサービス「Playcal」でテニスの練習相手や仲間を見つけてみませんか？',
        image: image_url("https://s3-ap-northeast-1.amazonaws.com/playcal-picture/playcal/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88+2018-11-19+10.47.45.png"),
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@PlaycalOfficial',
        title: '「シンプルで簡単に」テニスの練習相手や仲間が見つかる',
        description: 'テニスをより楽しく、より上手に。テニスのマッチングサービス「Playcal」でテニスの練習相手や仲間を見つけてみませんか？',
        image: image_url("https://s3-ap-northeast-1.amazonaws.com/playcal-picture/playcal/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88+2018-11-19+10.47.45.png"),
      }
    }
  end

end

module ActionView
  module Helpers
    module FormHelper
      def error_messages!(object_name, options = {})
        resource = self.instance_variable_get("@#{object_name}")
        return '' if !resource || resource.errors.empty?

        messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

        html = <<-HTML
          <div class="alert alert-danger">
            <ul>#{messages}</ul>
          </div>
        HTML

        html.html_safe
      end

      def error_css(object_name, method, options = {})
        resource = self.instance_variable_get("@#{object_name}")
        return '' if resource.errors.empty?

        resource.errors.include?(method) ? 'has-error' : ''
      end
    end

    class FormBuilder
      def error_messages!(options = {})
        @template.error_messages!(@object_name, options.merge(object: @object))
      end

      def error_css(method, options = {})
        @template.error_css(@object_name, method, options.merge(object: @object))
      end
    end
  end
end
