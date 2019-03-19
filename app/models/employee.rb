class Employee < ApplicationRecord
    #Relationship Testing
    has_many :assignments
    has_many :stores, through: :assignments
    
    #Validation Testing
    validates :first_name, :last_name, :date_of_birth, :role, :ssn, presence: true
    #Scope Testing
end
