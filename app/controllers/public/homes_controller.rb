class Public::HomesController < ApplicationController
  skip_before_action :authenticate_user!


# -----ホームビュー VV VV


  def top

    # 検索機能 vv vv
    # 検索情報取得
    if scope = params[:scope]
      @posts = Post.where("title LIKE ?","%"+ scope + "%")
      @groups = Group.where("name LIKE ?","%"+ scope + "%")
    else

    # scopeがなければ全て取得
      @posts = Post.all
      @groups = Group.all
    end
    # 検索機能 ^^ ^^
  end


  def about
  end


# -----ホームビュー AA AA
end


