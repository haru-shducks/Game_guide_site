class Public::HomesController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    # 検索機能
    if scope = params[:scope]
      @posts = Post.where("title LIKE ?","%"+ scope + "%")
      @groups = Group.where("name LIKE ?","%"+ scope + "%")
    else# if scope params[:scope]
      @posts = Post.all
      @groups = Group.all
    end# if scope params[:scope]
  end

  def genre_scope
    if genre_id = params[:genre_id]
      @genre = Genre.find(genre_id)
      @post_genre = @genre.post_genres
    else# if genre_id = params[:genre_id]
      redirect_to root_path
    end# if genre_id = params[:genre_id]
  end

  def about
  end

end