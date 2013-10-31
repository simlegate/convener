require 'spec_helper'

describe User do
  context '#find_by_omniauth' do
    before :each do
      @auth = {'info'=> { 'nickname' => 'simlegate'}, 'provider' => 'github'}
    end

    it 'should create a new user' do
      user = User.find_by_omniauth(@auth)
      expect(user.nickname).to eq('simlegate')
    end
    
    it 'should not create new user when user exists' do
      User.find_by_omniauth(@auth)
      user = User.find_by_omniauth(@auth)
      expect(User.count).to eq(1)
    end

    it 'should not create user when auth invaid' do
      expect {User.find_by_omniauth({'info'=> { 'nickname' => 'simlegate1'}})}.to raise_error
    end
  end
end
