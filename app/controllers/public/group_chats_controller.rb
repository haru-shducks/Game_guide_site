class Public::GroupChatsController < ApplicationController


  def create


    # グループ情報取得
    @group = Group.find(params[:group_id])

    # グループチャット作成
    @chat = GroupChat.new(chat_params)
    @chat.user_id = current_user.id
    @chat.group_id = @group.id
    @chat.save
    redirect_to group_path(@group)
    # グループチャット作成　おしまい
  end


# -----ストロングパラメータ VV VV


  private


  def chat_params
    params.require(:group_chat).permit(:text)
  end


# -----ストロングパラメータ AA AA


end
