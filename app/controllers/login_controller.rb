class LoginController < ApplicationController
    def index
        redirect_to("/sign_in")
    end
end
