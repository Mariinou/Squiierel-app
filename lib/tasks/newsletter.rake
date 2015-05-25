namespace :newsletter do
    desc "newsletter"
    task :send => :environment do
        UserMailer.newsletter.deliver
    end
end
