class Public::GroupUsersController < ApplicationController


# -----グループ参加 VV VV


  def create


    # グループ情報取得
    @group = Group.find(params[:group_id])

    # グループ参加
    @group_user = GroupUser.new
    @group_user.user_id = current_user.id
    @group_user.group_id = @group.id
    @group_user.save
    redirect_to group_path(@group.id)
    # グループ参加　おしまい


  end


# -----グループ参加 AA AA



# -----グループ退会 VV VV


  def destroy
    @group = Group.find(params[:id])
    @group_user = GroupUser.find_by(user_id: current_user.id,group_id: @group.id)
    @group_user.destroy
    redirect_to group_path(@group.id)
  end


# -----グループ退会 AA AA


end
