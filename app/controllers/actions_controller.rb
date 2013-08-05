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
        puts params
        @action = Action.new(params[:action])

        if @action.save
            redirect_to @action
        else
            render :new
        end

        respond_to do |format|
            format.html
            format.json { render json: @action }
        end
    end

    def destroy
    end

    private

    def get_action
        @action = Action.find(params[:id])
    end

    def action_parameters
        params.require(:action).permit(:action_id)
    end
end

