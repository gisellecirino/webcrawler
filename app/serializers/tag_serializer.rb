class TagSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :tag
  has_many :quote, serializer: QuoteSerializer
end
