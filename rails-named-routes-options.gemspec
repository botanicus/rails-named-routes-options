#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

Gem::Specification.new do |s|
  s.name = "rails-named-routes-options"
  s.version = "0.0.1"
  s.authors = ["Jakub Stastny aka Botanicus"]
  s.homepage = "http://github.com/botanicus/rails-named-routes-options"
  s.summary = "This Rails plugin adds default_named_routes_options to your controllers and mailers"
  s.description = "#{s.summary}, so you can specify default options for named routes like ActionMailer::Base.default_named_routes_options[:only_path] = false"
  s.cert_chain = nil
  s.email = Base64.decode64("c3Rhc3RueUAxMDFpZGVhcy5jeg==\n")
  s.has_rdoc = true

  # files
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  # runtime dependencies
  s.add_dependency "actionpack" # and probably actionmailer, but hey, it's up to you mate

  begin
    require "changelog"
  rescue LoadError
    warn "You have to have changelog gem installed for post install message"
  else
    s.post_install_message = CHANGELOG.new.version_changes
  end

  # RubyForge
  s.rubyforge_project = "rails-named-routes-options"
end
