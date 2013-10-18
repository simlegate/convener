class Project

 include Mongoid::Document
 include Mongoid::Timestamps

  belongs_to :user

  field :name
  field :description

  validates_presence_of :name, :user_id

  def self.create_with_current_user params, current_user
    project = new(params) do |project|
      project.user = current_user
    end

    project.save!
    project
  end

  def self.find_with_current_user current_user
    self.where(user_id: current_user.id)
  end
end
