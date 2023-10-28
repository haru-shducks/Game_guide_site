class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :name,:email,:password, :password_confirmation

  has_many :posts,        dependent: :destroy
  has_many :group_users,  dependent: :destroy
  has_many :group_chats,  dependent: :destroy
  
end
