namespace :db do
  desc 'Load an initial set of data'
  task :bootstrap => :environment do
    puts 'Creating tables...'
    Rake::Task["db:migrate"].invoke
    
    puts 'Loading data...'
    if User.count == 0
      user = User.create(:first_name => 'Admin', :last_name => 'User', :username => 'admin', :password => 'changeme', :password_confirmation => 'changeme', :email => 'test@example.com', :admin => true)
    end
    
    if Fund.count == 0
      funds = [
        { 'name' => 'Tithe / General Fund' },
        { 'name' => 'Activity Fees' },
        { 'name' => 'Benevolence' },
        { 'name' => 'Building Fund' },
        { 'name' => 'Missions Fund' },
        { 'name' => 'Technology' }
      ].collect do |fund|
        Fund.create(fund)
      end
    end
    
    puts "All done!  You can now login to your account at the localhost domain with the login admin and password changeme.\n\n"
  end
end