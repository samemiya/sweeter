class SweetsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_sweet, only: [:edit, :update, :destroy]  

  def index
    @sweets = Sweet.all
  end

  def new
    if params[:back]
      @sweet = Sweet.new(sweets_params)
    else
      @sweet = Sweet.new
    end
  end

  def create
    @sweet = Sweet.new(sweets_params)
    if @sweet.save
      # 一覧画面へ遷移して投稿した旨のmsgを表示
      redirect_to sweets_path, notice: "スィーツ情報ありがとうございます！"    
      # NoticeMailer.sendmail_blog(@blog).deliver
    else
      # 入力frm再描画
      render 'new' 
    end
  end
  
  def edit
    # edit, update, destroyで共通コード
    set_sweet
  end
  
  def update
    # edit, update, destroyで共通コード
    @sweet = Sweet.find(params[:id])
    if @sweet.update(sweets_params)
      redirect_to sweets_path, notice: "スィーツ情報を更新しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    # edit, update, destroyで共通コード
    set_sweet
    @sweet.destroy
    redirect_to sweets_path, notice: "スィーツ情報を削除しました！"
  end
  
  def confirm
    @sweet = Sweet.new(sweets_params)
    render :new if @sweet.invalid?
  end

  private
      def sweets_params
        params.require(:sweet).permit(:content)
      end

      # idをキーとして値を取得するメソッド
      def set_sweet
        @sweet = Sweet.find(params[:id])
      end

end
