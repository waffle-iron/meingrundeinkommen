class Api::SupportsController < ApplicationController

  def create
    support = Support.create(params.permit(:amount_total, :amount_for_income, :amount_internal, :payment_method, :recurring))

    if current_user
      support.nickname = current_user.name
      support.email = current_user.email
    end

    if support.valid?
      support.save!
      render json: support
    else
      render json: {:errors => support.errors}
    end
  end

  def update
    Support.find(params[:id]).update_attributes(:comment => params[:comment], :nickname => params[:nickname])
    render json: 'success'
  end

  def index
    render json: Support.where('comment is not null and payment_completed is not null').limit(30).order(:updated_at => :desc)
  end

  def show
    render json: Support.find(params[:id])
  end


end
