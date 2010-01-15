# encoding: utf-8

# === Usage ===
# class InvitationsMailer < ActionMailer::Base
#   default_named_routes_options[:only_path] = false
# end
#
# or just:
# ActionMailer::Base.default_named_routes_options[:only_path] = false

module NamedRoutesOptions
  def routes_names
    methods = self.instance_methods
    methods.grep(/_path$/).inject(Array.new) do |result, method|
      name = method.match(/^(.+)_path$/)[1]
      result.push(name) if methods.include?("#{name}_url")
      result
    end
  end

  # NOTE: this can't be a class variable, because class variables are shared
  attr_writer :default_named_routes_options
  def default_named_routes_options
    @default_named_routes_options ||= Hash.new
  end

  def self.extended(mailer)
    super(mailer)
    mailer.class_eval do
      self.routes_names.each do |route|
        helper_method "#{route}_path", "#{route}_url"
        define_method("#{route}_path") do |*args|
          options = args.last.is_a?(Hash) ? args.pop : Hash.new
          args.push(options.reverse_merge!(:only_path => false))
          super(*args)
        end

        alias_method "#{route}_url", "#{route}_path"
      end
    end
  end
end

ActionMailer::Base.extend(NamedRoutesOptions) if defined?(ActionMailer)
ActionController::Base.extend(NamedRoutesOptions) if defined?(ActionController)
