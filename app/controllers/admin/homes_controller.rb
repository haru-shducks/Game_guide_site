class Admin::HomesController < ApplicationController
  
  
  def top
    
    # 検索機能
    if post_name = params[:post_name]
      @posts = Post.where("title LIKE ?","%"+ post_name + "%")
    else
      @posts = Post.all
    end
    # 検索機能　おしまい
    
  end
  
  
end
