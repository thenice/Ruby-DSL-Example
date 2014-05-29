require("logger")

class Component

  attr_accessor :actions

  def self.log
    @@log ||= Logger.new("FireLog")
  end

  def initialize
    @actions = {}
  end

  def define(action_name, pre_message, post_message)
    @actions[action_name] = Proc.new do
      Component.log.info(pre_message)
      yield if block_given?
      Component.log.info(post_message)
    end
  end

  def install(*extra)
    options = extra[0]
    pre_message = "Begin installing component #{options[:package_name]}"
    post_message = "End installing component #{options[:package_name]}"
    define(:install, pre_message, post_message) { yield if block_given? }
  end

  def post_install(*extra)
    options = extra[0]
    pre_message = "Begin post installation steps for #{options[:package_name]}"
    post_message = "End post installation for component #{options[:package_name]}"
    define(:post_install, pre_message, post_message) { yield if block_given? }
  end

  def uninstall(*extra)
    options = extra[0]
    pre_message = "Begin uninstalling component #{options[:package_name]}"
    post_message = "End uninstalling component #{options[:package_name]}"
    define(:uninstall, pre_message, post_message) { yield if block_given? }
  end


end
