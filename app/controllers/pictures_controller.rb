class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
  end

  def create
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

end
