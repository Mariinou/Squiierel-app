namespace :newsletter do
    desc "newsletter"
    task :send => :environment do
        User.send_newsletter
    end
end
