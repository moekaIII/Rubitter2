class MurmursController < ApplicationController
  before_action :set_murmur, only:[:show, :edit, :update, :destroy]

  def index
    @murmurs = Murmur.all
  end

  def new
    if params[:back]
      @murmur = Murmur.new(murmur_params)
    else
      @murmur = Murmur.new
    end
  end

  def create
    @murmur = Murmur.new(murmur_params)
    if @murmur.save
      redirect_to murmurs_path, notice: "Rubeet was successfully create."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @murmur.update(murmur_params)
      redirect_to murmurs_path, notice: "Rubeet was successfully edited."
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @murmur.destroy
    redirect_to murmurs_path, notice:"Rubeet was successfully destroyed."
  end

  def confirm
    @murmur = Murmur.new(murmur_params)
    render :new if @murmur.invalid?
  end

private

  def murmur_params
    params.require(:murmur).permit(:content)
  end

  def set_murmur
    @murmur = Murmur.find(params[:id])
  end
end
