ActiveAdmin.register Attendance do
  form do |f|
    f.inputs do
      f.input :date, :as => :datepicker
      f.input :from, :as => :just_time_picker
      f.input :to, :as => :just_time_picker

      f.input :presence, :collection => %w(present absent) + [ 'not sure' ], :include_blank => false

      f.input :priority, :collection => %w(low medium urgent), :include_blank => false
      f.input :frequency, :collection => %w(daily weekly monthly yearly)

      f.input :admin_user_id, :as => :hidden, :value => current_admin_user.id

      f.input :message
    end

    f.buttons
  end
end
