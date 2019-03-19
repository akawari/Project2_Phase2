require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  should have_many(:assignments)
  should have_many(:employees).through(:assignments)
  should validate_presence_of(:name)
  
  context "Testing the scopes" do
    setup do
      create_stores
    end
  end
end
