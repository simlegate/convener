class Project < ActiveRecord::Base

  belongs_to :user

	attr_accessor :name
	attr_accessor :description
	attr_accessor :user_id

  validates_presence_of :name, :user_id

  def self.create_with_current_user params, current_user
    project = new(params) do |project|
      project.user_id = current_user.id
    end

    project.save!
    project
  end

  def self.find_with_current_user current_user
    self.where(user_id: current_user.id)
  end
end
