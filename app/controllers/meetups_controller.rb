class MeetupsController < ApplicationController

  before_action :set_meetup, except: [:index, :new, :create]

  def index
    @meetups = Meetup.all
  end

  def show
  end

  private
  def set_meetup
    @meetup = Meetup.find params[:id]
  end
end
