class Article < ActiveRecord::Base
  attr_accessible :title, :description, :url, :category_id
  belongs_to :category
  has_and_belongs_to_many :tags
end
