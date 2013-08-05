require 'spec_helper'

describe ObservationsController do

  describe "POST 'create'" do
      it "creates an observation object when sent a post request" do
          post :create, :observation => {
              :observation_number => 10101
          }
          expect(assigns[:observation]).to_not be_new_record
          expect(response).to redirect_to(assigns[:observation])
      end
  end

end
