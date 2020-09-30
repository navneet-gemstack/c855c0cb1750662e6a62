class Api::UserController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :set_user, only: [:show, :update, :destroy]

	def index
		render json: User.paginate(page: params[:page], per_page: 3)
	end

	def show
		render json: @user	
	end

	def create
		@user = User.new(user_params)      
		if @user.save
			render json: @user
		else
			render json: @user.errors, status: :unprocessable_entity 
		end
	end

	def update
		if @user.update(user_params)
			render json: @user
		else
			render json: @user.errors, status: :unprocessable_entity 
		end
	end

	def destroy
		@user.destroy
		render json: {user:[], message:"record deleted successfully"}
	end

	def typeahead
		user = User.type_match(params[:input]) 
		render json: user

	end

	private

	def set_user
		@user = User.find(params[:id])
		render json: "Record Not Found" unless @user.present?

	end

	def user_params
		params.require(:user).permit(:firstName,:lastName,:email)
	end

end

