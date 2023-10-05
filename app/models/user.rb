class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  # Attributes
  attribute :name, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0
  attribute :photo, :string

  # Validations
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :role, inclusion: { in: %w[admin user], message: '%<value>s is not a valid role [admin, user]' }

  def is?(requested_role)
    role == requested_role.to_s
  end

  # Method
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
