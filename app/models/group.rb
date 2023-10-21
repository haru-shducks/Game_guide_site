class Group < ApplicationRecord
  has_many :group_users
  belongs_to :leader, class_name: "User"

end
