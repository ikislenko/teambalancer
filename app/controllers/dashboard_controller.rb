class DashboardController < ApplicationController
  respond_to :json

  def rebalance
    @users = User.rebalance

    render json: @users.to_json(:include => :tasks)
  end

  def clear
    @users = User.clear

    render json: @users.to_json(:include => :tasks)
  end
end
