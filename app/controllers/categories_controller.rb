class CategoriesController < ApplicationController

  def index

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You've successfully created a new category"

      redirect_to category_path(@category)
    else
      render :new
    end
  end



  private

  def category_params
    params.require(:category).permit(title:)
  end

end
