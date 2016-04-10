# The following code is copied from
#   http://webmasters.stackexchange.com/questions/64812/how-to-include-the-contents-of-a-markdown-page-into-a-post-with-jekyll
#
# To use this plugin with the markdown file 'profile.md', insert the
# following line to the target file
#   {% markdown profile.md %}
#
# However, this plugin can not be used on the GitHub Pages for
# a security reason.

module Jekyll
  class MarkdownTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end
    require "kramdown"
    def render(context)
      "#{Kramdown::Document.new(File.read(File.join(Dir.pwd, '_includes', @text))).to_html}"
    end
  end
end
Liquid::Template.register_tag('markdown', Jekyll::MarkdownTag)
