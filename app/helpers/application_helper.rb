module ApplicationHelper
    def link_to_button(text, path)
        "<button class=\"btn btn-primary btn-lg btn-block\" onclick=\"document.location='#{path}'\">#{text}</button>".html_safe
    end
end
