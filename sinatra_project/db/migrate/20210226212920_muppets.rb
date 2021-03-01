class Muppets < ActiveRecord::Migration[6.1]
  def change
    create_table :muppets do |t|
      t.string :name
      t.string :job
    end
  end
end
