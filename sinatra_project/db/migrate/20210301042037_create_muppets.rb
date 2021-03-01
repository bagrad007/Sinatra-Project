class CreateMuppets < ActiveRecord::Migration[6.1]
  def change
    create_table :muppets do |t|
      t.string :name
      t.string :job
      t.integer :user_id
    end
  end
end
