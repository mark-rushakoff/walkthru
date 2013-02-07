require 'highline'
require 'walkthru/matchers'

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

    def say(message)
      @highline.say message
    end

    def yes_no(message)
      @highline.agree(message) do |q|
        q.default = 'y'
      end
    end

    def no_yes(message)
      @highline.agree(message) do |q|
        q.default = 'n'
      end
    end
  end
end
