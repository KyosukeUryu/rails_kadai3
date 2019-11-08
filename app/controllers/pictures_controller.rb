class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to root_path, notice: '投稿しました！'
    else
      render :new, notice: '投稿できませんでした'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

end
