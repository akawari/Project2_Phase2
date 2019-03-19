# We need to require the three files

require './test/sets/store_contexts'
require './test/sets/employee_contexts'
require './test/sets/assignment_contexts'

module Contexts
  # include all sets of contexts used for testing 
  include Contexts::StoreContexts
  include Contexts::EmployeeContexts
  include Contexts::AssignmentContexts

  # these methods create and destroy the contexts all at once, in a proper order
  # all at once, in their proper order
  def create_contexts
    create_stores
    create_employees
    create_assignments
  end

  def remove_contexts
    remove_stores
    remove_employees
    remove_assignments
  end

end