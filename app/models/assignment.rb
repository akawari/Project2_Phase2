class Assignment < ApplicationRecord
  # Relationship Testing
  belongs_to :employee
  belongs_to :store
  
  # Validation Testing
  validates :pay_level, numericality: {only_integer: true, greater_than: 0, less_than: 7 }#Because these are the constarints from the document
  validates_date :start_date, on_or_before: lambda { Date.current }, on_or_before_message: "cannot be created in the future date"
  validates_date :end_date, after: :start_date, on_or_before: lambda { Date.current }, allow_blank: true
  #End dates can be blank to note that they are active
  
  # Scopes Testing
  scope :current,       -> { where(end_date: nil) }
  scope :past,          -> { where.not(end_date: nil) }
  scope :for_store,     -> (store_id) { where("store_id = ?", store_id) }
  scope :for_employee,  -> (employee_id) { where("employee_id = ?", employee_id) }
  scope :for_pay_level, -> (pay_level) { where("pay_level = ?", pay_level) }
  scope :for_role,      -> (role) { joins(:employee).where("role = ?", role) }
  scope :by_store,      -> { joins(:store).order('name') }
  scope :by_employee,   -> { joins(:employee).order('last_name, first_name') }
  scope :chronological, -> { order('start_date DESC, end_date DESC') }
  
  #Other Methods
  
  private 
  def end_previous_assignment
    current_assignment = Employee.find(self.employee_id).current_assignment
    if current_assignment.nil?
      return true 
    else
      terminate_all_future_shifts
      current_assignment.update_attribute(:end_date, self.start_date.to_date)
    end
  end
end
