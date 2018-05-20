class HostReviewsController < ApplicationController

  def create
    # Check if the reservation exist

    @reservation = Reservation.where(
                    id: host_review_params[:reservation_id],
                    room_id: host_review_params[:room_id],
                    user_id: host_review_params[:guest_id]
                   ).first

    if !@reservation.nil?

      @has_reviewed = HostReview.where(
                        reservation_id: @reservation.id,
                        guest_id: host_review_params[:guest_id]
                      ).first

      if @has_reviewed.nil?
          # Allow review
          @host_review = current_user.host_reviews.create(host_review_params)
          flash[:success] = "review created..."
      else
          # Already revewed
          flash[:success] = "You have already rated this reservation"
      end
    else
      flash[:alert] = "Could not locate this  reservation"
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @host_review = Review.find(params[:id])
    @host_review.destroy
##https://stackoverflow.com/questions/2139996/how-to-redirect-to-previous-page-in-ruby-on-rails
    redirect_back(fallback_location: request.referer, notice: "Review deleted!")
  end

  private
    def host_review_params
      params.require(:host_review).permit(:comment, :star, :room_id, :reservation_id, :guest_id)
    end
end
