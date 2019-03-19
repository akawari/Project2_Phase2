class Employee < ApplicationRecord
    #Relationship Testing
    has_many :assignments
    has_many :stores, through: :assignments
    
    #Validation Testing
    validates :first_name, :last_name, :date_of_birth, :role, :ssn, presence: true
    validates_date :date_of_birth, on_or_before: lambda { 18.years.ago }, on_or_before_message: "must be at least 18 years old"
    validates_format_of :phone, with: /([0-9]+-*[0-9])/, message: "must be 10 digits with dashes only", allow_blank: true
    validates_format_of :ssn, with: /\A\d{3}[- ]?\d{2}[- ]?\d{4}\z/, message: "should be 9 digits with dashes only"
    validates_inclusion_of :role, in: %w[admin manager employee], message: "is not valid"
    validates_uniqueness_of :ssn
  
    #Scope Testing
    scope :younger_than_18, -> { where('date_of_birth > ?', 18.years.ago.to_date) }
    scope :is_18_or_older,  -> { where('date_of_birth <= ?', 18.years.ago.to_date) }
    scope :active,          -> { where(active: true) }
    scope :inactive,        -> { where(active: false) }
    scope :regulars,        -> { where(role: 'employee') }
    scope :managers,        -> { where(role: 'manager') }
    scope :admins,          -> { where(role: 'admin') }
    scope :alphabetical,    -> { order('last_name, first_name') }
  
  # Other methods
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
  
  def current_assignment
    curr_assignment = self.assignments.select{|a| a.end_date.nil?}
    return nil if curr_assignment.empty?
    curr_assignment.first   # return as a single object, not an array
  end
  
  def over_18?
    date_of_birth < 18.years.ago.to_date
  end
  
  def age
    (Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  end
end
