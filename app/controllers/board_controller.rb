class BoardController < ApplicationController
    before_action :authenticate_user!

    before_filter :authorize, :except => :index

    def index

    end

end

