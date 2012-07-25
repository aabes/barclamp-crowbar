require 'test_helper'

class BarclampTest < ActiveSupport::TestCase
#  fixtures :barclamps
  self.use_instantiated_fixtures = true
#  setup_fixtures

  test "create barclamp" do
    b1 = Barclamp.new({:description => "first one", :name=>"t1"})
    assert b1.save
    b2 = Barclamp.new({:description => "first one", :name=>"t2"})
    b1.barclamp_dependencies << BarclampDependency.new( { :barclamp=>b1, :prereq=>b2 })
    assert b2.save

    b1 = Barclamp.find_by_name("t1")
    assert_equal b1.prereqs.size,1, "have righ dependencies"
  end

  test "loaded fixtures" do
    assert !barclamps('one').nil?,"have a barclamp"
  end

end
