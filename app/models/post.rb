class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Attributes
  attribute :title, :string
  attribute :text, :text
  attribute :comment_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :update_user_posts_counter

  def excerpt
    return text unless text.length > 50

    "#{text.slice(0, 50)} ..."
  end

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
