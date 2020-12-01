class ApplicationController < ActionController::Base
    include UserStaticPagesHelper
    def hello
        render html: "hello world!"
    end

end
