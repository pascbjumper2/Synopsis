class LandingController < ApplicationController

  skip_before_filter :redirect, only: [:index, :create]


  def index
    @configedit = Design.new
  end

  def create
    puts 'I HIT CREATE!!!!! YAYAYAYAYYYAAYAYAYA'
    @configedit = Design.new(allowed_params)

    if @configedit.save
      puts 'wow saved'
      redirect_to root_path
    else
      puts 'much fail'
      puts @configedit.inspect
      redirect_to 'index'
    end
  end

private
  def allowed_params
    params.require(:design).permit(:name, :style)
  end


end
