class AdministrateursController < ApplicationController

    before_filter :authorize

    def new_user
        @user = User.new
    end

    def create_user
        @user = User.new(user_params)
        if @user.save
            #success
        else
            #error
        end

    end

    private

    def user_params
        params.require(:user).permit(:nom, :prenom, :email, :promo, :numtel, :role, :password)
    end
end
