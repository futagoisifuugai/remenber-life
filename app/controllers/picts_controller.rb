class PictsController < ApplicationController
  def index
    @name = current_user.name
    @picts = Pict.includes(:user).order("created_at DESC").page(params[:page]).per(3)
  end
  def new
    @pict = Pict.new
  end

  def create
    Pict.create(pict_params)
  end

  def show
    user = User.find(params[:id])
    @pict = user.picts.page(params[:page]).per(3).order("created_at DESC")
  end


  private
  def pict_params
    params.require(:pict).permit(:name,:text, :image1,:image2,:image3,:image4).merge(user_id: current_user.id)
  end
end
