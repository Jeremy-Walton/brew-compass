# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { user: 'user', admin: 'admin' }

  validates :first_name, :last_name, :role, presence: true

  # Associations

  has_many :brews, dependent: :destroy
  has_many :beans, dependent: :destroy
  has_many :brewing_methods, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end
end
