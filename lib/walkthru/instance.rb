require 'highline'

module Walkthru
  class Instance
    attr_reader :highline
    def initialize(stdin, stdout)
      @highline = HighLine.new(stdin, stdout)
    end

    def instruct(message)
      @highline.say message
      @highline.ask '[Press ENTER to continue]' do |q|
        q.overwrite = true
        q.echo = false
      end
    end
  end
end
