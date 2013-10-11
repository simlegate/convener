class RolifyCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_users, :id => false) do |t|
      t.references :user
      t.references :user
    end

    add_index(:users, :name)
    add_index(:users, [ :name, :resource_type, :resource_id ])
    add_index(:users_users, [ :user_id, :user_id ])
  end
end
