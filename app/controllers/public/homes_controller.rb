class Public::HomesController < ApplicationController


# -----ホームビュー VV VV


  def top
    if post_name = params[:post_name]
      @posts = Post.where("title LIKE ?","%"+ post_name + "%")
    else
      @posts = Post.all
    end
  end

  def about
  end
end


# -----ホームビュー AA AA