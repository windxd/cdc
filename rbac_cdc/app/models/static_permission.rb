class StaticPermission < ActiveRecord::Base
  acts_as_static_permission
  has_and_belongs_to_many :roles
end
