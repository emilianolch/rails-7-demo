class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :content
  broadcasts_to :post
end
