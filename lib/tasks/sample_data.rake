namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
     User.all(:limit => 6).each do |user|
      20.times do
        user.themes.create!(:content => Faker::Lorem.sentence(5))
      end
    end

     User.all.each do |user|
        10.times do
            user.posts.create!(:content=> Faker::Lorem.sentence(5))
        end
     end 
    Theme.all.each do |theme|
      10.times do
          theme.posts.create
      end
    end 
    
  end
end

