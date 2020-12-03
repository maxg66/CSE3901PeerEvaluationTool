module ApplicationHelper
    def link_to_button(text, path)
        "<button class=\"btn btn-danger btn-lg btn-block\" onclick=\"document.location='#{path}'\">#{text}</button>".html_safe
    end

    def link_to_primary_button(text, path)
        "<button class=\"btn btn-danger\" onclick=\"document.location='#{path}'\">#{text}</button>".html_safe
    end
end
