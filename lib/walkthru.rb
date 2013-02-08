require 'walkthru/instance'
require 'logging'

Logging.logger.root.level = :warn
Logging.logger.root.appenders = Logging.appenders.stderr

module Walkthru
  def self.create(opts = {})
    Walkthru::Instance.new(opts[:stdin] || STDIN, opts[:stdout] || STDOUT)
  end
end
