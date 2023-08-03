class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attribute :email, :string
  validates :name, presence: true, allow_blank: true

  has_many :inventories
  has_many :recipes
end
