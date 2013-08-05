require 'spec_helper'

describe ActionsController do
    it "accepts a json query and builds an action object with measurements" do
        post :create, :action => {
            :action_id => 10101
        }
        expect(assigns(:action)).to_not be_nil
    end
end
