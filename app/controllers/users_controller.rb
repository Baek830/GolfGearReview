class UsersController < ApplicationController
  before_action :find_user
  
  def show
    @gears = @user.gears.includes(:maker)
    @drivers = @gears.where(club_id: 1)
    @fairwaywoods = @gears.where(club_id: 2)
    @utilitys = @gears.where(club_id: 3)
    @irons = @gears.where(club_id: 4)
    @wedges = @gears.where(club_id: 5)
    @putters = @gears.where(club_id: 6)
    @balls = @gears.where(club_id: 7)
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
