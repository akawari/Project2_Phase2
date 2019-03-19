require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  #Relationship Testing
  should have_many(:assignments)
  should have_one(:store).through(:assignments)
  
  #Validation Testing
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:ssn)
  should validate_presence_of(:role)
  should validate_presence_of(:date_of_birth)
  
  # Tests for phone
  should allow_value("3369522900").for(:phone)
  should allow_value("336-952-2900").for(:phone)
  should_not allow_value("336.952.2900").for(:phone)
  should_not allow_value("(336) 952-2900").for(:phone)
  should_not allow_value("363636").for(:phone)
  should_not allow_value("112233445566778").for(:phone)
  should_not allow_value("33366634y34").for(:phone)
  should_not allow_value("444-EAT-ICE").for(:phone)
  should_not allow_value("444/666/3434").for(:phone)
  should_not allow_value("444-3434-666").for(:phone)
  
  # Tests for ssn
  should allow_value("298605180").for(:ssn)
  should_not allow_value("12345678").for(:ssn)
  should_not allow_value("1234567890").for(:ssn)
  should_not allow_value("bad").for(:ssn)
  should_not allow_value(nil).for(:ssn)
  
  # Test for date_of_birth
  should allow_value(18.years.ago.to_date).for(:date_of_birth)
  should allow_value(15.years.ago.to_date).for(:date_of_birth)
  should_not allow_value(14.years.ago.to_date).for(:date_of_birth)
  should_not allow_value(13.years.ago).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(nil).for(:date_of_birth)
  # Test for role
  should allow_value("admin").for(:role)
  should allow_value("manager").for(:role)
  should allow_value("employee").for(:role)
  should_not allow_value("bad").for(:role)
  should_not allow_value("flavor").for(:role)
  should_not allow_value(10).for(:role)
  should_not allow_value("vp").for(:role)
  should_not allow_value(nil).for(:role)
  
  #Scope Testing through contexts
  context "Creating context for employees" do
    setup do 
      create_employees
    end
    
    teardown do
      remove_employees
    end
    
    
  end
end
