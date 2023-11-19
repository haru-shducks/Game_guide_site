class Public::GroupsController < ApplicationController


# -----グループビュー VV VV


  def show
    @chat = GroupChat.new
    @group = Group.find(params[:id])
    @leader = @group.leader
    @group_users = @group.group_users
    @messages = @group.group_chats

  end


# -----グループビュー AA AA



# -----グループ作成 VV VV


  def new
    @group = Group.new
  end


  def create

    # グループ作成
    @group = Group.new(group_params)
    @group.leader_id = current_user.id
    @group.save

    # グループ参加　グループリーダー
    @group_user = GroupUser.new
    @group_user.user_id = current_user.id
    @group_user.group_id = @group.id
    @group_user.save

    redirect_to group_path(@group.id)

  end


# -----グループ作成 AA AA



# -----グループ編集 VV VV


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer
    else
      render "edit"
    end
  end


# -----グループ編集 AA AA



# -----グループ削除 VV VV


  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end


# -----グループ削除 AA AA


# -----ストロングパラメータ VV VV


  private


  def group_params
    params.require(:group).permit(:name)
  end


# -----ストロングパラメータ AA AA


end
