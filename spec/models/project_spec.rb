require 'spec_helper'

describe Project do
  context 'create_with_current_user' do
    let(:user){ create(:user) }
    let(:project){ create(:project) }

    it 'should create new project' do
      test_project = Project.create_with_current_user(attributes_for(:project), user)
      expect(test_project.user_id).to eq(user.id)
    end

    it 'should return a new project' do
      test_project = Project.create_with_current_user(attributes_for(:project), user)
      expect(test_project).to be_instance_of(Project)
    end

    it 'should raise error when current_user is nil' do
      expect{ Project.create_with_current_user(attributes_for(:project), nil)}.to raise_error
    end

    it 'should raise error when name is nil' do
      expect{ Project.create_with_current_user({:description => "test project"}, user)}.to raise_error
    end

    it 'should not raise error when description is nil' do
      expect{ Project.create_with_current_user({:name => "simlegate"}, user)}.not_to raise_error
    end
  end
end
