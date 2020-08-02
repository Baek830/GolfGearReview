class GearsController < ApplicationController
  before_action :find_gear, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    if params[:maker].blank?
      @gears = Gear.all.order("created_at DESC")
    else
      @maker_id = Maker.find_by(name: params[:maker]).id
      @gears = Gear.where(:maker_id => @maker_id).order("created_at DESC")
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
    @gear = current_user.gears.build
    @makers = Maker.all.map{ |c| [c.name, c.id] }
    @clubs = Club.all.map{ |c| [c.name, c.id] }
  end
  
  def create
    @gear = current_user.gears.build(gear_params)
    @gear.maker_id = params[:maker_id]
    @gear.club_id = params[:club_id]
    if @gear.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @makers = Maker.all.map{ |c| [c.name, c.id] }
    @clubs = Club.all.map{ |c| [c.name, c.id] }
  end
  
  def update
    @gear.maker_id = params[:maker_id]
    @gear.club_id = params[:club_id]
    if @gear.update(gear_params)
      redirect_to gear_path(@gear)
    else
      render 'edit'
    end
  end
  
  def destroy
    @gear.destroy
    redirect_to root_path
  end

  private
    def gear_params
      params.require(:gear).permit(:name, :description, :club, :maker_id, :club_id, :image)
    end

    def find_gear
      @gear = Gear.find(params[:id])
    end
end

