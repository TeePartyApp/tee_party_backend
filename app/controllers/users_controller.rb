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

    @user = User.where.not(id: current_user.id).order("RANDOM()").first
    render json: @user
  end

  def filter_users
    if current_user.nil?
      render json: { error: "User not logged in" }, status: :unauthorized and return
    end
  
    # Permit filter parameters
    filters = params.permit(
      :location, 
      :handicap_min, :handicap_max,
      :gir_min, :gir_max,
      :fairways_hit_min, :fairways_hit_max,
      :putts_per_round_min, :putts_per_round_max
      )
  
    # Start with all users except the current user
    users = User.where.not(id: current_user.id)
  
    # Apply filters if present
    users = users.where(location: filters[:location]) if filters[:location].present?
    users = users.where(handicap: filters[:handicap_min]..filters[:handicap_max]) if filters[:handicap_min].present? && filters[:handicap_max].present?
    users = users.where(gir: filters[:gir_min]..filters[:gir_max]) if filters[:gir_min].present? && filters[:gir_max].present?
    users = users.where(fairways_hit: filters[:fairways_hit_min]..filters[:fairways_hit_max]) if filters[:fairways_hit_min].present? && filters[:fairways_hit_max].present?
    users = users.where(putts_per_round: filters[:putts_per_round_min]..filters[:putts_per_round_max]) if filters[:putts_per_round_min].present? && filters[:putts_per_round_max].present?
  
    if users.empty?
      render json: { message: "No users found based on the provided filters" }, status: :not_found and return
    end
    
    # Select a random user from the filtered list
    user = users.order("RANDOM()").first
  
    render json: user
  end
  
end
