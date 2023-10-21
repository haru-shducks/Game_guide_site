class Public::GroupUsersController < ApplicationController


# -----グループ参加 VV VV


  def create
    @group_user = GroupUser.new
    group = Group.find(params[:id])
    @group_user.user_id = current_user.id
    @group_user.group_id = group.id
    @group_user.save
  end


# -----グループ参加 AA AA



# -----グループ退会 VV VV


  def destroy
    @group_user = GroupUser.find(params[:group_id],current_user[:user_id])
    @group_user.destroy
  end


# -----グループ退会 AA AA


end
