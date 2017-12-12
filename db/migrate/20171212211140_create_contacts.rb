class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text      :name
      t.text      :position
      t.text      :email
      t.timestamps
    end
  end
end
