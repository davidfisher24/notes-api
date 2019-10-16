class SharesController < ApplicationController

  # GET /shares
  def index
    # get current user shares
    @shares = current_user.shares.paginate(page: params[:page], per_page: 20)
    json_response(@shares)
  end

end
