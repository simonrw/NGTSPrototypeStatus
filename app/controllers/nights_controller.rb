class NightsController < ApplicationController
    def show
        @night = Night.find(params[:id])
    end
end
