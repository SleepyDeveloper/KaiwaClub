class MeetupsController < ApplicationController

  before_action :set_meetup, except: [:index, :new, :create]

  def index
    @meetups = Meetup.all.order(date: :desc)
  end

  def new
    @meetup = Meetup.new
  end

  def edit
  end

  # action to create a meetup. Vanilla CRUD
  def create
    @meetup = Meetup.new(meetup_params)

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to @meetup, notice: 'Meetup was successfully created.' }
        format.json { render :show, status: :created, location: @meetup }
      else
        format.html { render :new }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  # adds and attendee to a meetup
  def attend_meetup
    if @meetup.update(meetup_params)
      flash[:success] = 'Marked Attending'
      redirect_to @meetup
    else
      flash[:danger] = @meetup.errors.full_messages.join(",")
      redirect_to @meetup
    end
  end

  # creates the incoming user and adds them to the meetup it was submitted from
  def add_and_attend_meetup
    user = User.new(name: params[:user][:name],
      email: params[:user][:email],
      native_language: params[:user][:native_language])

    respond_to do |format|
      if user.save
        @meetup.meetup_attendees.create(user_id: user.id)

        flash[:success] = "#{user.name} marked as present."
        format.html { redirect_to @meetup }
        format.json { render :show, status: :created, location: @meetup}
      else
        flash[:danger] = "Problem creating user: #{user.errors.full_messages.join(", ")}"
        format.html { redirect_to @meetup }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meetup
    @meetup = Meetup.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meetup_params
    params.require(:meetup).permit(:date, :meetup_attendees_attributes => [:user_id])
  end
end
