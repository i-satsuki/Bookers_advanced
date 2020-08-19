class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

	has_many :book, dependent: :destroy

	attachment :image

	validates :name, presence: true, uniqueness: true, length: {minimum: 2}
	validates :email, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true

	def email_required?
		false
	end

	def email_changed?
		false
	end
end
