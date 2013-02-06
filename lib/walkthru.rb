require 'walkthru/instance'

module Walkthru
  def self.create(opts = {})
    Walkthru::Instance.new(opts[:stdin] || STDIN, opts[:stdout] || STDOUT)
  end
end
