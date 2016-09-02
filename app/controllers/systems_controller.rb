class SystemsController < ApplicationController
  before_action :authenticate_user!


  def index
    @systems = System.order(:system_name)
  end

  def new
    @system = System.new
  end

  def create
    @system = System.new(user_params)
    if @system.save
      flash[:success] = "System saved successfully"
      redirect_to @system
    else
      render 'new'
    end
  end

  def show
    @system = System.find(params[:id])
  end

  def destroy
    System.find(params[:id]).destroy
    flash[:success] = "System deleted"
    redirect_to systems_path
  end

  def import
    if params[:file]
      System.import(params[:file])
      redirect_to systems_path, notice: "CSV imported"
    else
      redirect_to systems_path, alert: "Please select a CSV file for import"
    end
  end

  private
    def user_params
      params.require(:system).permit(:system_name)
    end
end
