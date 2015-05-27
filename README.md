#Squiierrel
Donnez de la puissance à vos stages !

Squiierrel est un projet de programmation Web réalisé dans le cadre de l'enseignement **IPW** dispensé à l'**ENSIIE**.

Ce site a pour but de centraliser les annonces de stage/alternance à destination des élèves de l’ENSIIE.
Tout utilisateur doit être enregistré avant d'accéder au site. Le site possède une partie administration pour faciliter les modifications et suppressions des annonces/utilisateurs.

##Prérequis
Avoir installé Ruby on rails (**2.2.0 ou supérieur**)

##Pour installer & lancer l'application
    git clone https://github.com/Squiierel/Squiierel-app.git

puis
        
    ./install.sh
    rails s

##Pour créer un premier utilisateur : 

    rails console
    User.create!(nom: '[Votre nom]', prenom: '[Votre Prénom]', email: '[Un Email Valide]', approved: 'true', type: '[Eleve ou Administrateur]', role: '[Rôle]', password: '[Mot de passe]')

##Permettre l'envoi de mails : 

Modifier le fichier correspondant à votre environnement et décommenter/remplir les lignes suivantes avec vos identifiants smtp :

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_options = {from: '[email voulu]'}
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address:              '[adresse du serveur smtp]',
        port:                 [port],
        user_name:            '[Nom de compte smtp]',
        password:             '[Mot de Passe associé]'
        }

##Pour lancer le démon de Newsletter

Pour activer l'envoi automatique chaque semaine des annonces disponibles :

    clockwork clock.rb