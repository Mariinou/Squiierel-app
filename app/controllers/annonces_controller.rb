class AnnoncesController < ApplicationController
    before_action :authenticate_user!

    before_filter :authorize, :except => [:index,:show,:create,:new]

    def index
        if params[:etat] == "true"
            @etat="true"
            if params[:type] == "stage"
                @annonces = Annonce.where(genre:'Stage',etat:true,validee:true)
                @annoncesinvalides = Annonce.where(genre:'Stage',etat:true,validee:false)
                @type="stage"
            elsif params[:type] == "alternance"
                @annonces = Annonce.where(genre:'Alternance',etat:true,validee:true)
                @annoncesinvalides = Annonce.where(genre:'Alternance',etat:true,validee:false)
                @type="alternance"
            else
                @annonces = Annonce.where(etat:true,validee:true)
                @annoncesinvalides = Annonce.where(etat:true,validee:false)
                @type="all"
            end

        elsif params[:etat] == "false"
            @etat="false"
            if params[:type] == "stage"
                @annonces = Annonce.where(genre:'Stage',etat:false,validee:true)
                @annoncesinvalides = Annonce.where(genre:'Stage',etat:false,validee:false)
                @type="stage"
            elsif params[:type] == "alternance"
                @annonces = Annonce.where(genre:'Alternance',etat:false,validee:true)
                @annoncesinvalides = Annonce.where(genre:'Alternance',etat:false,validee:false)
                @type="alternance"
            else
                @annonces = Annonce.where(etat:false,validee:true)
                @annoncesinvalides = Annonce.where(etat:false,validee:false)
                @type="all"
            end
        else
            @etat="all"
            if params[:type] == "stage"
                @annonces = Annonce.where(genre:'Stage',validee:true)
                @annoncesinvalides = Annonce.where(genre:'Stage',validee:false)
                @type="stage"
            elsif params[:type] == "alternance"
                @annonces = Annonce.where(genre:'Alternance',validee:true)
                @annoncesinvalides = Annonce.where(genre:'Alternance',validee:false)
                @type="alternance"
            else
                @annonces = Annonce.where(validee:true)
                @annoncesinvalides = Annonce.where(validee:false)
                @type="all"
            end
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
            redirect_to home_path
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
            redirect_to home_path
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
        params.require(:annonce).permit(:entreprise, :titre, :description, :duree, :datedebut, :moyencontact, :genre, :validee)
    end

end

