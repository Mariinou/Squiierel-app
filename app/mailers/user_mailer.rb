class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user)
        @user = user
        @url  = 'http://localhost:3000/users/sign_in'
        mail(to: @user.email,from: "noreply@squiierrel.com", subject: 'Welcome to My Awesome Site')
    end

    def rep_annonce_auteur(user,email,id)
        @email=email
        @annonce = Annonce.find(id)
        @eleve = User.find(user)
        @url = "https://squiierrel.scalingo.io/annonces/show/" + id
        mail(to: @email,from: "noreply@squiierrel.com", subject: 'Réponse à votre annonce : ' + @annonce.titre)
    end

    def rep_annonce_eleve(user,email,id)
        @email=email
        @annonce = Annonce.find(id)
        @user=User.find(user)
        mail(to: @email,from: "noreply@squiierrel.com", subject: "Confirmation de votre intérêt à l'annonce : " + @annonce.titre)
    end

    def newsletter(email,annonce_ids)
        @annonce_ids=annonce_ids
            mail(to: email,from: "noreply@squiierrel.com", subject: "Les annonces du moment [" + I18n.l(Time.now, format: "%B").capitalize + "]")
    end
end
