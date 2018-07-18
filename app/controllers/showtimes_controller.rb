class ShowtimesController < ApplicationController
  before_action :store_location_with_message
  before_action :require_user, :only => [:buyTix, :confirmTixPurchase, :finishTixPurchase]

  # GET /showtimes
  # GET /showtimes.json
  def index
    @theater = Theater.find(params[:theater_id])
    @showtimes = @theater.showtimes
    @movie_hash = Hash.new{|hash, key| hash[key] = []}
    @showtimes.each do |showtime|
      @movie_hash[showtime.movie_id.to_s] << showtime
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @showtimes }
    end
  end

  # GET /movie/:movie_id/showtimes
  # GET /movie/:movie_id/showtimes.json
  def showtimesByMovie
    @movie = Movie.find(params[:movie_id])
    @showtimes = @movie.showtimes
    @theater_hash = Hash.new{|hash, key| hash[key] = []}
    @showtimes.each do |showtime|
      @theater_hash[showtime.theater_id.to_s] << showtime
    end

    respond_to do |format|
      format.html # showtimesByMovie.html.erb
      format.json { render json: @showtimes }
    end
  end

  # GET /showtimes/1
  # GET /showtimes/1.json
  def show
    @showtime = Showtime.find(params[:id])
    @movie = Movie.find(@showtime.movie_id)
    @theater = Theater.find(@showtime.theater_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @showtime }
    end
  end

  # GET /showtimes/1/buyTix
  def buyTix
    @showtime = Showtime.find(params[:id])
    @movie = Movie.find(@showtime.movie_id)
    @theater = Theater.find(@showtime.theater_id)

    respond_to do |format|
      format.html #buyTix.html.erb
    end
  end

  # POST /showtimes/1/confirmTixPurchase
  def confirmTixPurchase
    @showtime = Showtime.find(params[:id])
    @movie = Movie.find(@showtime.movie_id)
    @theater = Theater.find(@showtime.theater_id)
    @num_tix = params[:tix]
    seats_left = @showtime.seats_available.to_int - @num_tix.to_i

    if seats_left < 0 then
      @error_message = 'Only ' + @showtime.seats_available.to_s + ' seat' + (@showtime.seats_available.to_int > 1 ? 's' : '') + ' available for this showtime'
      @showtime.errors.add(:available_seats, @error_message)
    end

    respond_to do |format|
      format.html #confirmTixPurchase.html.erb
    end
  end

  # POST /showtimes/1/finishTixPurchase
  def finishTixPurchase
    @showtime = Showtime.find(params[:id])
    @movie = Movie.find(@showtime.movie_id)
    @theater = Theater.find(@showtime.theater_id)
    @num_tix = params[:tix]

    seats_left = @showtime.seats_available.to_int - @num_tix.to_i

    if seats_left < 0 then
      @error_message = 'Only ' + seats_left + ' seats available for this showtime'
      @showtime.errors.add(:available_seats, @error_message)
    else
      @showtime.seats_available = seats_left
      if @showtime.tickets_sold == nil then
        @showtime.tickets_sold = 0
      end
      @showtime.tickets_sold = @showtime.tickets_sold + @num_tix.to_i
      @showtime.save

      @purchase = Purchase.create(:user_id => @current_user.id, :showtime_id => @showtime.id, :num_tickets => @num_tix.to_i)
    end

    respond_to do |format|
      format.html #finishTixPurchase.html.erb
    end
  end

  # GET /showtimes/new
  # GET /showtimes/new.json
  def new
    @showtime = Showtime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @showtime }
    end
  end

  # GET /showtimes/1/edit
  def edit
    @showtime = Showtime.find(params[:id])
  end

  # POST /showtimes
  # POST /showtimes.json
  def create
    @showtime = Showtime.new(showtime_params)

    respond_to do |format|
      if @showtime.save
        format.html { redirect_to @showtime, notice: 'Showtime was successfully created.' }
        format.json { render json: @showtime, status: :created, location: @showtime }
      else
        format.html { render action: "new" }
        format.json { render json: @showtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /showtimes/1
  # PUT /showtimes/1.json
  def update
    @showtime = Showtime.find(params[:id])

    respond_to do |format|
      if @showtime.update_attributes(showtime_params)
        format.html { redirect_to @showtime, notice: 'Showtime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @showtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showtimes/1
  # DELETE /showtimes/1.json
  def destroy
    @showtime = Showtime.find(params[:id])
    @showtime.destroy

    respond_to do |format|
      format.html { redirect_to showtimes_url }
      format.json { head :no_content }
    end
  end

  def showtime_params
    params.require(:showtime).permit(:movie_id, :seats_available, :theater_id, :time, :movie, :theater, :tickets_sold)
  end
end
