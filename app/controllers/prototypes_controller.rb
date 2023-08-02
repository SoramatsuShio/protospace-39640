class PrototypesController < ApplicationController



  
  def index
    @prototypes = Prototype.includes(:user)
  end


  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user) # コメントを取得し、関連するユーザー情報を同時に取得する
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end



  def edit
    @prototype = Prototype.find(params[:id])
    
    if current_user != @prototype.user
      redirect_to root_path, alert: "You are not authorized to edit this prototype."
    end

  end

  def update
    @prototype = Prototype.find(params[:id])

    if @prototype.update(prototype_params)
      # 更新が成功した場合の処理
      redirect_to @prototype
    else
      # 更新が失敗した場合の処理
      render :edit
    end
  end

  

  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)

  if @prototype.save
    # 保存が成功した場合の処理（例えば、作成したプロトタイプの詳細ページへリダイレクト）
    redirect_to '/'
  else
    # 保存が失敗した場合の処理（例えば、新規プロトタイプ投稿画面を再表示）
    render :new
  end

   end

  private
     
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end



end


