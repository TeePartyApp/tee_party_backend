class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end
  
  def show
    @user = User.find_by(id: params[:id])
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
    @user = User.find_by(id: params[:id])
    @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      location: params[:location] || @user.location,
      handicap: params[:handicap] || @user.handicap,
      gir: params[:gir] || @user.gir,
      fairways_hit: params[:fairways_hit] || @user.fairways_hit,
      putts_per_round: params[:putts_per_round] || @user.putts_per_round,
      password: params[:password] || @user.password,
      password_confirmation: params[:password_confirmation] || @user.password_confirmation,
      image_url: params[:image_url] || @user.image_url
    )
    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User has been deleted." }
  end
end
