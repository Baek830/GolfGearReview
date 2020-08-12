class GearsController < ApplicationController
  before_action :find_gear, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @users = User.all.order("created_at DESC")
    if params[:maker].blank?
      @gears = Gear.includes(:user).order("created_at DESC")
    else
      @maker_id = Maker.find_by(name: params[:maker]).id
      @gears = Gear.where(maker_id: @maker_id).order("created_at DESC")
    end
  end

  def show
    if @gear.reviews.blank?
      @average_review = 0
    else
      @average_review = @gear.reviews.average(:rating).round(2)
    end
  end

  def new
    @gear = current_user.gears.new
  end
  
  def create
    @gear = current_user.gears.new(gear_params)
    if @gear.save
      redirect_to root_path, notice: 'Gear was successfully created.'
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @gear.update(gear_params)
      redirect_to gear_path(@gear), notice: 'Gear was successfully updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    @gear.destroy
    redirect_to root_path, notice: 'Gear was successfully destroyed.'
  end

  private
    def gear_params
      params.require(:gear).permit(:name, :description, :maker_id, :club_id, :image)
    end

    def find_gear
      @gear = Gear.find(params[:id])
    end

end

