class Store < ApplicationRecord
    #Relationship Testing
    has_many :assignments
    has_many:employees, through: :assignments
    
    #Validation Testing
    
    #Scope Testing
end
