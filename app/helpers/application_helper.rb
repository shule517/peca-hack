module ApplicationHelper
  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
      def block_code(code, language)
          language = language.split(':')[0]

          case language.to_s
          when 'rb'
              lang = 'ruby'
          when 'yml'
              lang = 'yaml'
          when 'css'
              lang = 'css'
          when 'html'
              lang = 'html'
          when ''
              lang = 'md'
          else
              lang = language
          end

          CodeRay.scan(code, lang).div
      end
  end

  def markdown(text)
    begin
      html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
      options = {
          autolink: true,
          space_after_headers: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          tables: true,
          hard_wrap: true,
          xhtml: true,
          lax_html_blocks: true,
          strikethrough: true
      }
      markdown = Redcarpet::Markdown.new(html_render, options)
      markdown.render(text)
    rescue
      ''
    end
  end

  # HTMLで書けない文字の実体参照と改行コードのHTMLへの置換を行う
  def to_br(target)
    target = html_escape(target)
    target.gsub(/\r\n|\r|\n/, "<br />")
  end

  def countdown(date)
    seconds = (Time.now - date)
    days = seconds / (60 * 60 * 24)
    days = days.to_i
    return "#{date.month}月#{date.day}日" if days > 0

    hours = seconds / (60 * 60)
    hours   = hours.to_i;
    return "#{hours}時間前" if hours > 0

    minutes = (seconds / 60).to_i
    return "#{minutes}分前" if minutes > 0

    return "#{seconds}秒前"
  end
end
