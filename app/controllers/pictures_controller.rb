class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  def index
    @pictures = Picture.page(params[:page]).per(5).order(created_at: :desc)
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
        # ConfirmMailer.confirm_mail(@picture).deliver
        redirect_to root_path, success: '投稿しました！'
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    if @picture.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id), info: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_path, danger: '投稿を削除しました'
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def favor_pictures
    @pictures = current_user.favor_pictures
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
