require 'sidekiq'
require 'sidekiq-cron'
class CrawlerJob
    include Sidekiq::Worker
  
    def perform(*args)
        CrawlerSearch.new.create
    end
    
    Sidekiq::Cron::Job.create(name: 'Crawler Job - every 12h', cron: '0 */12 * * *', class: 'CrawlerJob') 
end