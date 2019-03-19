class Store < ApplicationRecord
    #Relationship Testing
    has_many :assignments
    has_many:employees, through: :assignments
    
    #Validation Testing
      # Here, we make sure that all required fields are present
      validates_presence_of :name, :street, :zip
      # if state is given, must be one of the choices given
      validates_inclusion_of :state, :in => %w[PA OH WV], message: "is not valid"
      # zip must be 5 digits only
      validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"
      # phone can have dashes, spaces, but must be 10 digits
      validates_format_of :phone, with: /([0-9]+-*[0-9])/, message: "must be 10 digits with dashes only"
      #Only integers
      validates :phone, numericality: {only_integer: true}, length:{is: 10}
      
    #Scope Testing
    
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    
  #private
  # We need to strip non-digits before saving to db
  #def format_phone
    #phone = self.phone.to_s  # change to string in case input as all numbers 
    #phone.gsub!(/[^0-9]/,"") # strip all non-digits
    #self.phone = phone       # reset self.phone to new string
  #end
end
