class Public::PostsController < ApplicationController


# -----グループビュー VV VV


  def show
    @post = Post.find(params[:id])
    @genre = @post.post_genres
  end


# -----グループビュー AA AA



# -----投稿　作成 VV VV


  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    @post.score = Language.get_data(post_params[:content])
    @post.user_id = current_user.id
    @post.save
    Language.analyze_entity_sentiment(post_params[:title], @post.id)

    redirect_to root_path
  end


# -----投稿　作成 AA AA



# -----投稿編集 VV VV


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post.score = Language.get_data(post_params[:content])
    if @post.update(post_params)
      redirect_to post_path(params[:id])
    else
      render "edit"
    end
  end


# -----投稿編集 AA AA



# -----投稿削除 VV VV


  def destroy
    post = Post.find(params[:id])
    post.destroy
    @genres.each do |genre|
      if genre.post_genres.count == 0
        genre.destroy
      end
    end
    redirect_to root_path
  end


# -----投稿削除 AA AA



# -----ストロングパラメータ VV VV


  private


  def post_params
    params.require(:post).permit(:title,:content)
  end


# -----ストロングパラメータ AA AA


end
