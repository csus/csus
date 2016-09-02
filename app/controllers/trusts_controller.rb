class TrustsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trusts = Trust.order(:trust_legal_name)
  end

  def new
    @trust = Trust.new
  end

  def create
    @trust = Trust.new(trust_params)
    if @trust.save
      flash[:success] = "Trust saved successfully"
      redirect_to @trust
    else
      render 'new'
    end
  end

  def edit
    @trust = Trust.find(params[:id])
  end

  def update
    @trust = Trust.find(params[:id])
    if @trust.update_attributes(trust_params)
      flash[:success] = "Trust updated successfully"
      redirect_to @trust
    else
      render 'edit'
    end
  end

  def show
    @trust = Trust.find(params[:id])
  end

  def import
    if params[:file]
      Trust.import(params[:file])
      redirect_to trusts_path, notice: "CSV imported"
    else
      redirect_to trusts_path, alert: "Please select a CSV file for import"
    end
  end

  def destroy
    Trust.find(params[:id]).destroy
    flash[:success] = "Trust deleted"
    redirect_to trusts_path
  end

  private
    def trust_params
      params.require(:trust).permit(:latitude, :longitude, :created_at, :updated_at, :trust_number, :trust_legal_name, :trust_display_name, :trust_type, :trust_region, :trust_date_of_establishment, :trust_main_phone, :trust_hq_address_line_1, :trust_hq_address_line_2, :trust_hq_address_line_3, :trust_hq_address_line_4, :trust_postcode, :trust_country, :trust_website_url, :trust_email_pattern, :trust_nhs_code)
    end
end
