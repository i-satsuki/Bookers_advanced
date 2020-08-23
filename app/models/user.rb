class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

	has_many :books, dependent: :destroy

	attachment :profile_image

	validates :name, presence: true, uniqueness: true, length: {minimum: 2}, length: {maximum: 20}
	validates :email, presence: true
	validates :password, presence: true, length: { minimum: 6 }, on: :create
	validates :password_confirmation, presence: true, on: :create
	validates :introduction, length: {maximum: 50}

	def email_required?
		false
	end

	def email_changed?
		false
	end
end
