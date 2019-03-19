require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  should have_many(:assignments)
  should have_one(:store).through(:assignments)
end
