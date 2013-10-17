class User
  include Mongoid::Document

  field :provider
  field :nickname

  validates_presence_of :nickname, :provider

  has_many :projects

  def self.find_by_omniauth auth
    # not validate with find_or_create_by
    user = User.where(nickname: auth['info']['nickname'], provider: auth['provider']).first_or_create!
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.nickname = auth['info']['nickname']
    end
  end

  def admin?
    true
  end
end
