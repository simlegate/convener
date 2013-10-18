require 'spec_helper'

describe FeedsController do

  describe "current_user" do
    it 'should be nil when session[:user_id] is nil' do
      session[:user_id] = nil
      expect(controller.current_user).to be_nil
    end

    it 'should get a user instance' do
      user = create(:user)
      session[:user_id] = user.id
      expect(controller.current_user).to be_instance_of User
      expect(controller.current_user.id).to eq(user.id)
    end
  end

end
