class ContactsController < ApplicationController
  def create
    @contact = current_user.contact_sent.build(doctor_id: params[:user_id])
    if @contact.save
      flash[:success] = 'Request to doctor sent!'
    else
      flash[:danger] = 'Request to doctor failed!'
    end
    redirect_back(fallback_location: root_path)
  end
end
