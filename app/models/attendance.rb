class Attendance < ActiveRecord::Base
  # just_define_datetime_picker :date, :add_to_attr_accessible => true
  just_define_time_picker :from, :add_to_attr_accessible => true
  just_define_time_picker :to, :add_to_attr_accessible => true

  attr_accessible :date, :from, :to, :admin_user_id
  attr_accessible :presence, :message, :priority, :frequency

  validates :date, :presence => true

  validates :from, :presence => true

  validates :to, :presence => true

  validates :presence,
    :inclusion => [ 'present', 'absent', 'not sure' ],
    :presence => true

  validates :priority,
    :inclusion => %w(urgent medium low),
    :presence => true

  # TODO: validate if `to` is later than `from`

  #validates :frequency,
    # :inclusion => %w(daily weekly monthly yearly),
    #:presence => false

  belongs_to :admin_user

  after_initialize :set_default_values

  def frequency_to_num
    translate_dictionary = {
        'daily' => 1,
        'weekly' => 2,
        'monthly' => 3,
        'yearly' => 4
    }

    translate_dictionary[frequency] or 0
  end

  def priority_to_num
    translate_dictionary = {
        'low' => 1,
        'medium' => 2,
        'urgent' => 3
    }

    translate_dictionary[priority] or 0
  end

  protected

  def set_default_values
    presence = 'present'
    priority = 'low'
    frequency = ''
  end
end
