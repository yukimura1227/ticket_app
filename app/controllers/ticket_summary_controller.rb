# For Ticket Summary
class TicketSummaryController < ApplicationController
  before_action :authenticate_user!

  # /users/1/ticket_summary.json
  def user_summary
    fail if params[:id].to_i != current_user.id
    @user = User.find(params[:id])
    render json: [Ticket.calc_summary_for_user(current_user)]
  end
end