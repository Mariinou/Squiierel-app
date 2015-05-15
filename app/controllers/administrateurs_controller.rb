class AdministrateursController < ApplicationController

    before_filter :authorize

    def index
        if params[:approved] == "false"
            @users = User.where(approved:false)
            @all=false
        else
            @users = User.all
            @all=true
        end
    end

    def new_user
        @user = User.new
    end

    def edit_user
        @user = User.find(params[:id])
    end

    def create_user
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = 'Utilisateur ajouté avec succès'
            redirect_to admin_path
        else
            render :action => 'new_user'
        end

    end

    private

    def user_params
        params.require(:user).permit(:nom, :prenom, :email, :promo, :numtel, :role, :password, :approved,:type)
    end
end
