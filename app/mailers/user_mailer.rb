class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user)
        @user = user
        @url  = 'http://localhost:3000/users/sign_in'
        mail(to: @user.email,from: "noreply@squiierrel.com", subject: 'Welcome to My Awesome Site')
    end

    def rep_annonce_auteur(url,user,email,id)
        @auteur = User.where(email:email)
        @annonce = Annonce.find(id)
        @eleve = user
        @url = url
        mail(to: @auteur.email,from: "noreply@squiierrel.com", subject: 'Réponse à votre annonce')
    end

    def rep_annonce_eleve(user,email,id)
        @annonce = Annonce.find(id)
        @user=user
        mail(to: @auteur.email,from: "noreply@squiierrel.com", subject: "Confirmation de votre intérêt à un annonce")
    end
end
