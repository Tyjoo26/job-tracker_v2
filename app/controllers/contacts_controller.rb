class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "You've associated a contact with #{@company.name}"

      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
