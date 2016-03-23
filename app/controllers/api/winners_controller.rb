class Api::WinnersController < ApplicationController

  caches_page :index
  skip_before_filter :verify_authenticity_token, :only => [:index]
  # everyone's a winner baby, that's for sure! :)

  def index
    winners = User.includes(:chances, :payment, :wishes).select('id,name,avatar').where('winner > 0').order('winner asc')
    render json: winners, serializer: nil
  end

end
