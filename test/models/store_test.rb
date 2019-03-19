require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  #Relationships:
  should have_many(:assignments)
  should have_many(:employees).through(:assignments)
  
  #First Basic Validations:
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:zip)
  
  # Tests for zip
  should allow_value("29022").for(:zip)
  should_not allow_value("bad").for(:zip)
  should_not allow_value("2902").for(:zip)
  should_not allow_value("2902222").for(:zip)
  should_not allow_value("29022-0222").for(:zip)
  
  # Tests for state
  should allow_value("OH").for(:state)
  should allow_value("PA").for(:state)
  should allow_value("WV").for(:state)
  should_not allow_value("bad").for(:state)
  should_not allow_value("NY").for(:state)
  should_not allow_value(10).for(:state)
  should_not allow_value("CA").for(:state)
  # Tests for phone
  should allow_value("4446663434").for(:phone)
  should allow_value("444-666-3434").for(:phone)
  should_not allow_value("444.666.3434").for(:phone)
  should_not allow_value("(444) 666-3434").for(:phone)
  should_not allow_value("454545").for(:phone)
  should_not allow_value("112233445566778").for(:phone)
  should_not allow_value("44466634y34").for(:phone)
  should_not allow_value("444-EAT-ICE").for(:phone)
  should_not allow_value("444/666/3434").for(:phone)
  should_not allow_value("444-3434-666").for(:phone)
  
  context "Testing the scopes" do
    setup do
      create_stores
    end
    
    teardown do
      remove_stores
    end
    
    should "show that all factories are properly created" do
      assert_equal "Baskin Robbins", @baskin.name
      assert @baskin.active
    end
  
    # test the scope 'alphabetical'
    should "shows that five stores in alphabetical order" do
      assert_equal ["Baskin Robbins", "Cold Stone", "Godiva", "Haagen Dazs", "Tim Horton"], Store.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'active'
    should "shows that there are three active stores" do
      assert_equal 3, Store.active.size
      assert_equal ["Baskin Robbins", "Cold Stone", "Godiva"], Store.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there are two inactive store" do
      assert_equal 2, Store.inactive.size
      assert_equal ["Haagen Dazs", "Tim Horton"], Store.inactive.alphabetical.map{|s| s.name}
    end
  end
end
