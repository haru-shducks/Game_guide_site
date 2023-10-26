class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :group_chats, dependent: :destroy

  belongs_to :leader, class_name: "User"

end
