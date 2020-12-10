
  filename = Dir[Rails.root.join('db', 'unseed.rb')][0]

namespace :db do 
  desc "unseed"
  task unseed: :environment do
    load(filename)
  end
end