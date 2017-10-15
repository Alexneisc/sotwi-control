class WinnersController < ApplicationController
  def index
    unpaginated_winners = Winner.
      for_date(params[:date]).
      order(date: :desc)

    @winners_count = unpaginated_winners.count
    @winners = unpaginated_winners.page(params[:page]).includes(:tweet)
  end
end
