namespace :dev do
  desc "TODO"
  task setup: :environment do
    CrawlerSearch.new.create   
  end
end
