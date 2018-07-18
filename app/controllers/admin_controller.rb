class AdminController < ApplicationController
  before_action :store_location_with_message
  before_action :require_user, :only => [:index, :stats, :manage_users]

  def index
  end

  def stats
    @showtimes = Showtime.all
    @movie_tickets_sold_hash = Hash.new{|hash, key| hash[key] = 0}
    @movie_sales_hash = Hash.new{|hash, key| hash[key] = 0}
    @theater_tickets_sold_hash = Hash.new{|hash, key| hash[key] = 0}
    @theater_sales_hash = Hash.new{|hash, key| hash[key] = 0}

    @showtimes.each do |showtime|
      @movie = Movie.find(showtime.movie_id)
      @theater = Theater.find(showtime.theater_id)
      @movie_tickets_sold_hash[@movie.name] += showtime.tickets_sold
      @sales = showtime.tickets_sold * @theater.ticket_price
      @movie_sales_hash[@movie.name] += @sales.to_f
      @theater_tickets_sold_hash[@theater.name] += showtime.tickets_sold
      @theater_sales_hash[@theater.name] += @sales.to_f
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  def manage_users
  end
end
