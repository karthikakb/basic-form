class UsersController < ApplicationController
	def index
  	@user=User.all
  	@useraddress=Useraddress.all
  	@userphoto=Userphoto.all
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
