class QuoteSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  DEFAULT_INCLUDES = [:tags]

  attributes :quote, :author, :author_about
  has_many :tags, serializer: TagSerializer
end
