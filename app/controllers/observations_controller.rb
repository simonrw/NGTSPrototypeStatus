class ObservationsController < ApplicationController
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

  private

  def observation_params
      params.require("observation").permit(:observation_number)
  end
end
