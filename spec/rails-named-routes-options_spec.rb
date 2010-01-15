# encoding: utf-8

require_relative "spec_helper"

describe Rails-named-routes-options do
  it "should have VERSION constant" do
    Rails-named-routes-options::VERSION.should be_kind_of(String)
    Rails-named-routes-options::VERSION.should match(/^\d+\.\d+\.\d+$/)
  end
end
