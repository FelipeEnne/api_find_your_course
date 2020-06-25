class HomeController < ApplicationController
    def home
        render json: "Home"
    end
end
