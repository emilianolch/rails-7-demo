class Post < ApplicationRecord
  has_rich_text :content
  has_many :comments

  validates_presence_of :title
end
