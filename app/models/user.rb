class User
  include Mongoid::Document

  rolify :role_cname => 'User'
  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end
  field :provider
  field :nickname

  has_and_belongs_to_many :roles

  validates_presence_of :nickname, :provider

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
