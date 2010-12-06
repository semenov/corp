class Site
  include Mongoid::Document
  field :title
  field :slug
  field :description
  
  validates_presence_of :title, :slug
  validates_uniqueness_of :slug
end
