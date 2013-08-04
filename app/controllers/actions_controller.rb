class ActionsController < ApplicationController
    before_filter :get_action, :only => [:show, :update, :edit, :destroy]
    def show
    end

    def index
        @actions = Action.all
    end

    def update
    end

    def edit
    end

    def new
    end

    def create
    end

    def destroy
    end

    private

    def get_action
        @action = Action.find(params[:id])
    end
end

