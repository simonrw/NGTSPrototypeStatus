class ObservationsController < ApplicationController
    before_filter :fetch_observation, :only => [:show, ]
  def create
      @observation = Observation.new(observation_params)
      if @observation.save
          redirect_to @observation
      else
          render :new
      end
  end

  def index
      @observations = Observation.all
  end

  def show
  end

  private

  def observation_params
      params.require("observation").permit(:observation_number)
  end

  def fetch_observation
      @observation = Observation.find(params[:id])
  end
end
