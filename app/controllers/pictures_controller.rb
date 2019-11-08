class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to root_path, notice: '投稿しました！'
      else
        render :new, notice: '投稿できませんでした'
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @picture.update(picture_params)
    redirect_to picture_path(@picture.id), notice: '更新しました！'
  end

  def destroy
    @picture.destroy
    redirect_to root_path, notice: '投稿を削除しました'
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
