class BoardController < ApplicationController
    before_action :authenticate_user!

    before_filter :authorize, :except => :index

    def index
        @annonces = Annonce.all.order(:entreprise)
    end

    def new
        @annonce = Annonce.new
    end

    def create
        @annonce = Annonce.new(params[:annonce])
        if @annonce.save
            flash[:notice] = 'Annonce créée avec succès'
            redirect_to admin_path
        else
            render :action => 'new'
        end
    end

    def edit
        @annonce = Annonce.find(params[:id])
    end


    def update
        @annonce = Annonce.find(params[:id])
        if @annonce.update_attributes(params[:annonce])
            flash[:notice] = 'Mise à jour de l\' annonce effectuée avec succès'
            redirect_to admin_path
        else
            render :action => 'edit'
        end
    end

end

