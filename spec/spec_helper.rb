# encoding: utf-8

# constants
SPEC_ROOT = File.dirname(__FILE__)
ROOT      = File.expand_path(File.join(SPEC_ROOT, ".."))
LIBDIR    = File.join(ROOT, "lib")

# load paths
$:.unshift(LIBDIR)

require "spec" # so you can run ruby spec/rails-named-routes-options/whatever_spec.rb
