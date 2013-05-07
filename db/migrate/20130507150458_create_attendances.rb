class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.time :from
      t.time :to
      t.date :date
      t.text :message
      t.string :presence, :default => 'present'
      t.string :priority, :default => 'low'
      t.string :frequency

      t.timestamps
    end

    add_column :attendances, :admin_user_id, :integer
  end
end
