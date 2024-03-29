class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable


    def active_for_authentication?
        super && approved?
    end

    def inactive_message
        if !approved?
            :not_approved
        else
            super # Use whatever other message
        end
    end

    def self.send_reset_password_instructions(attributes={})
        recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
        if !recoverable.approved?
            recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
        elsif recoverable.persisted?
            recoverable.send_reset_password_instructions
        end
        recoverable
    end

    def self.send_newsletter
        annonce_ids = Annonce.select(:id).where(etat: true).to_a.map(&:id)
        self.select(:email).all.each{|user|
            UserMailer.newsletter(user.email, annonce_ids).deliver
        }
    end
end
