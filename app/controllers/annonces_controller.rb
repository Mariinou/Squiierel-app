class AnnoncesController < ApplicationController
    before_action :authenticate_user!

    before_filter :authorize, :except => [:index,:show,:create,:new]

    def index
        @annonces = Annonce.where(validee:true)

        if ['Stage', 'Alternance'].include?(params[:type])
            @annonces = @annonces.where(genre: params[:type].capitalize)
            @type=params[:type]
        end

        if ["true", "false"].include?(params[:type])
            if params[:type] == "true"
                @annonces = @annonces.where(etat: true)
            elsif params[:type] == "false"
                @annonces = @annonces.where(etat: true)
            else
                @annonces = @annonces.where()
            end
            @etat=params[:etat]
        end

        if params[:entreprise].present?
            @annonces = @annonces.where(entreprise:params[:entreprise])
            @entreprise = params[:entreprise]
        end

        @annoncesinvalides = Annonce.where(validee:false)

        if ['Stage', 'Alternance'].include?(params[:type])
            @annoncesinvalides = @annoncesinvalides.where(genre: params[:type].capitalize)
            @type=params[:type]
        end

        if ["true", "false"].include?(params[:type])
            if params[:type] == "true"
                @annoncesinvalides = @annoncesinvalides.where(etat: true)
            elsif params[:type] == "false"
                @annoncesinvalides = @annonces.where(etat: true)
            else
                @annoncesinvalides = @annoncesinvalides.where()
            end
            @etat=params[:etat]
        end

        if params[:entreprise].present?
            @annoncesinvalides = @annoncesinvalides.where(entreprise:params[:entreprise])
            @entreprise = params[:entreprise]
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

    def send_rep_mails
        @user=params[:user]
        @id=params[:id]
        @email=Annonce.find(@id).moyencontact
        @emaileleve=User.find(@user).email
        UserMailer.rep_annonce_auteur(@user,@email,@id).deliver
        UserMailer.rep_annonce_eleve(@user,@emaileleve,@id).deliver
        flash[:notice] = "Email de contact envoyé"
        redirect_to home_path
    end

    def destroy
        @annonce = Annonce.find(params[:id])
        @annonce.destroy
        flash[:notice] = 'Annonce supprimmée'
        redirect_to home_path
    end

    private

    def annonce_params
        params.require(:annonce).permit(:entreprise, :titre, :description, :duree, :datedebut, :moyencontact, :genre, :validee, :etat)
    end

end

