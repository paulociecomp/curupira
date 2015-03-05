class Role < ActiveRecord::Base
  has_many :authorizations
  has_many :features, through: :authorizations
<<<<<<< HEAD
  has_many :permissions
  has_many :group_users, through: :permissions
  has_many :role_groups
  has_many :groups, through: :role_groups
=======
  has_many :role_groups
  has_many :role_groups, through: :role_groups
>>>>>>> bugfix in view and tests
  accepts_nested_attributes_for :authorizations, reject_if: :all_blank, allow_destroy: :true
  validates_presence_of :name
end