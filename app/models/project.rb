class Project
  include Mongoid::Document

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
end
