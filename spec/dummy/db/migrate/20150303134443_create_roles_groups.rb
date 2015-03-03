class CreateRolesGroups < ActiveRecord::Migration
	def change
		create_table :role_groups do |t|
      		t.belongs_to :role, index: true
      		t.belongs_to :group, index: true

      		t.timestamps null: false
    	end
    	add_foreign_key :role_groups, :roles
    	add_foreign_key :role_groups, :groups  
  end
end