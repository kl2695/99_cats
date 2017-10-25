class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @request = CatRentalRequest.new(cr_params)
    if @request.save
      render plain: "success"
    else
      render plain: "failed!"
    end
  end

  def approve
    @rental_record = CatRentalRequest.find(params[:id])
    @rental_record.approve!
  end

  def deny
    @rental_record = CatRentalRequest.find(params[:id])
    @rental_record.deny!
  end

  private
  def cr_params
    params.require(:request).permit(:cat_id, :start_date, :end_date)
  end
end
