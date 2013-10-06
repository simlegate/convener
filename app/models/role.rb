# encoding: utf-8
# 这个model有问题
class Role
  include Mongoid::Document

  field :name

  has_and_belongs_to_many :users
end
