class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy, :reject]

  def index
    @matches = Match.where(user_id: current_user.id, status: 'accepted')
    render :index
  end

  def show
    @match = Match.find_by(id: params[:id])
    render :show
  end

  def create
    @match = Match.new(
      user_id: current_user.id,
      matched_user_id: params[:matched_user_id],
      status: params[:status] || 'pending'
    )

    if @match.save
      check_mutual_match(@match)
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(
      user_id: params[:user_id] || @match.user_id,
      matched_user_id: params[:matched_user_id] || @match.matched_user_id,
      status: params[:status] || @match.status
    )
      check_mutual_match(@match)
      render json: @match
    else
      render json: @match.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @match.destroy
    render json: { message: "You have been unmatched from this player" }
  end
  
  def reject
    if @match.update(status: 'rejected')
      render json: { message: "Match rejected" }
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private
  
    def set_match
      @match = Match.find_by(id: params[:id])
    end
      
    def check_mutual_match(match)
      reverse_match = Match.find_by(user_id: match.matched_user_id, matched_user_id: match.user_id)

      if reverse_match.present? && match.status == 'pending' && reverse_match.status == 'pending'
        match.update(status: 'accepted')
        reverse_match.update(status: 'accepted')
        render json: { match: match, message: "It's a match!" }, status: :created and return
      end
      render json: match, status: :created
    end
end
