class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tag, type: String
  has_and_belongs_to_many :quotes

  def self.search(search)
    CrawlerJob.perform_async    
    Tag.where(tag: search).first    
  end
end
