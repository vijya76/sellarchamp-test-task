class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_many :products, dependent: :destroy

  # validations
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
