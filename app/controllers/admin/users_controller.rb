class Admin::UsersController < ApplicationController

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

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id]).becomes(User)
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:notice] = 'Mise à jour de l\' utilisateur effectuée avec succès'
            redirect_to admin_users_path
        else
            @user=@user.becomes(User)
            render :action => 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = 'Utilisateur ajouté avec succès'
            redirect_to admin_users_path
        else
            render :action => 'new_user'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = 'Utilisateur supprimmé'
        redirect_to admin_users_path
    end

    private

    def user_params
        params.require(:user).permit(:nom, :prenom, :email, :promo, :numtel, :role, :password, :approved,:type)
    end
end
