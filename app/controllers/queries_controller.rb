class QueriesController < ApplicationController


  def index
    if params[:sort] == "location"
      @jobs = Job.order(:city)
    elsif params[:sort] == "interest"
      @jobs = Job.order(:level_of_interest).reverse
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
    else
      @jobs = Job.all
    end
  end



end
