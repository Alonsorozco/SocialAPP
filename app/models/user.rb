class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relación entre usuario y posts
  has_many :posts, dependent: :destroy
end
