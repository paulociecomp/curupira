class Group < ActiveRecord::Base
	has_many :role_groups
  	has_many :roles, through: :role_groups
  	
  	accepts_nested_attributes_for :role_groups, reject_if: :all_blank, allow_destroy: :true

	validates_presence_of :name
  	scope :active, -> { where active: true }
end