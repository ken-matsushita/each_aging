class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    # 選択したモデルに応じて検索を実行
    if @model  == "user"
      @records = User.search_for(@content, @method)
    else
      @records = PostImage.search_for(@content, @method)
    end
  end
  
  def genre_search
    @genre_id = params[:genre_id]
    @post_images = PostImage.where(genre_id: @genre_id).page(params[:page])
    @genres = Genre.all
  end
end
