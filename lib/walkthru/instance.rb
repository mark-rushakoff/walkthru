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
      answer = @highline.ask("#{message} [Yn]") do |q|
        validate_question_is_yes_no(q)
      end

      yn = Walkthru::Matchers.yes_no(answer)
      yn.yes? || yn.empty?
    end

    def no_yes(message)
      answer = @highline.ask("#{message} [yN]") do |q|
        validate_question_is_yes_no(q)
      end

      yn = Walkthru::Matchers.yes_no(answer)
      yn.yes?
    end

    private
    def validate_question_is_yes_no(question)
      question.validate = lambda do |answer|
        yn = Walkthru::Matchers.yes_no(answer)
        !(yn.unknown?)
      end

      question.responses[:not_valid] = question.question
      question.character = true
      question.echo = false
      question.overwrite = true
    end

    def suppress_echo(question)
      question.echo = false
    end
  end
end
