class User < ApplicationRecord
 
 # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relación entre usuario y posts
  has_many :posts, dependent: :destroy
end
