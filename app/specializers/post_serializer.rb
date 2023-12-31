class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :comment_counter, :likes_counter
  has_many :comments
  belongs_to :author, class_name: 'User'
end
