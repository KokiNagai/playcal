class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    MailSenderMailer.inquiry(@contact).deliver
    MailSenderMailer.inquiry1(@contact).deliver
    respond_to do |format|
         if @contact.save
                    format.html { redirect_to inquiry_confirm_path }
         else
           format.html { render action: 'new' }
         end
       end
  end

  def inquiry
  end

    private
    def contact_params
      params.require(:contact).permit(:email, :message)
    end
end
