class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end
  
  def show
    @user = current_user
    render :show
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      location: params[:location],
      handicap: params[:handicap],
      gir: params[:gir],
      fairways_hit: params[:fairways_hit],
      putts_per_round: params[:putts_per_round],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url]
    )
    if user.save
      render json: { message: "User successfully created!" }, status: :created
    else
      render json: { message: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = current_user
    @user.update!(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      location: params[:location] || @user.location,
      handicap: params[:handicap] || @user.handicap,
      gir: params[:gir] || @user.gir,
      fairways_hit: params[:fairways_hit] || @user.fairways_hit,
      putts_per_round: params[:putts_per_round] || @user.putts_per_round,
      image_url: params[:image_url] || @user.image_url
    )
    render :show
  end

  def destroy
    @user = current_user
    @user.destroy
    render json: { message: "User has been deleted." }
  end


  def random_users
    if current_user.nil?
      render json: { error: "User not logged in" }, status: :unauthorized and return
    end

    
    #Permit filter parameters
    filters = params.permit(:location, :handicap, :gir, :fairways_hit, :putts_per_round)

    @user = User.where.not(id: current_user.id)
    
    #Apply filters if present
    @user = User.where(location: filters[:location]) if filters[:location].present?
    @user = User.where(handicap: filters[:handicap]) if filters[:handicap].present?
    @user = User.where(gir: filters[:gir]) if filters[:gir].present?
    @user = User.where(fairways_hit: filters[:fairways_hit]) if filters[:fairways_hit].present?
    @user = User.where(putts_per_round: filters[:putts_per_round]) if filters[:putts_per_round].present?
    
    @user = User.order("RANDOM()").first
    render json: @user
  end
  
end
