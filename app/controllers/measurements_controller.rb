class MeasurementsController < ApplicationController
    before_filter :fetch_observation, :only => [:show, :index]
    def show
    end
   
    def index
    end

    private

    def fetch_observation
        @observation = Observation.find(params[:observation_id])
    end
end
