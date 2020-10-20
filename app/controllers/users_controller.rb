class UsersController < ApplicationController
	def index
  	@user=User.all 
  end
  def show
    @user=User.all
   
    respond_to do |format|
      format.pdf do
        pdf =  Prawn::Document.new
         @user.each do |user| 
        pdf.text "User Details"
        pdf.text "firstname :#{user.firstname}"
        pdf.text "lastname :#{user.lastname}"
        pdf.text "dob :#{user.dob}"
        pdf.text "email :#{user.email}"
        pdf.text "houseno :#{user.useraddress.houseno}"
        pdf.text "street :#{user.useraddress.street}"
        pdf.text "city :#{user.useraddress.city}"
        pdf.text "state :#{user.useraddress.state}"
        pdf.text "country :#{user.useraddress.country}"
      end
        send_data pdf.render,
          filename: "export.pdf",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end

  
  end

  def new
  	@user =User.new
  

  end

  def create
  	@user =User.create(user_params)
    @user.save
    redirect_to users_path
    puts @user.errors.inspect
  
  end
  def destory
    p "*******************"
    @user = User.find(params[:id])
    p "*************************"
   p @user.destroy
   respond_to do |format|
      format.html { redirect_to users_url notice: 'user was successfully destoryed' }
      format.js   { render :layout => false }
   end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user =User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :dob, 
      	useraddress_attributes: [:houseno, :street, :city, :state ,:country],
      	userphoto_attributes: [:attachment])
    end
end
