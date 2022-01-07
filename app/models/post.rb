class Post < ApplicationRecord
  has_rich_text :content
  has_many :comments, dependent: :destroy

  validates_presence_of :title
end
