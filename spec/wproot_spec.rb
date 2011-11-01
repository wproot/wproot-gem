require 'spec_helper'

describe WPRoot do
  it "should have a version" do
    WPRoot::VERSION.should be_a(String)
  end
end
