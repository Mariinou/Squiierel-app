class AnnoncesController < ApplicationController
    before_action :authenticate_user!

    before_filter :authorize, :except => [:index,:show]

    def index
        if params[:type] == "stage"
            @annonces = Annonce.where(genre:'Stage')
            @type="stage"
        elsif params[:type] == "alternance"
            @annonces = Annonce.where(genre:'Alternance')
            @type="alternance"
        else
            @annonces = Annonce.all
            @type="all"
        end
    end

    def admin
        @annonces = Annonce.all
    end

    def new
        @annonce = Annonce.new
    end

    def create
        @annonce = Annonce.new(annonce_params)
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

    def show
        @annonce = Annonce.find(params[:id])
    end

    def update
        @annonce = Annonce.find(params[:id])
        if @annonce.update_attributes(annonce_params)
            flash[:notice] = 'Mise à jour de l\' annonce effectuée avec succès'
            redirect_to admin_path
        else
            render :action => 'edit'
        end
    end

    def destroy
        @annonce = Annonce.find(params[:id])
        @annonce.destroy
        flash[:notice] = 'Annonce supprimmée'
        redirect_to home_path
    end

    private

    def annonce_params
        params.require(:annonce).permit(:entreprise, :titre, :description, :duree, :datedebut, :moyencontact, :genre)
    end

end

