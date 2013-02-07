module Walkthru
  module Matchers
    class << self
      def yes_no(text)
        answer = case text
                 when /^y(es)?$/i, /^$/
                   :yes
                 when /^no?$/i
                   :no
                 else
                   :unknown
                 end

        YesNoUnknown.new(answer)
      end
    end

    private
    class YesNoUnknown
      VALID_ANSWERS = [:yes, :no, :unknown].freeze
      def initialize(answer)
        raise 'Invalid input' unless VALID_ANSWERS.include? answer
        @answer = answer
      end

      def yes?
        @answer == :yes
      end

      def no?
        @answer == :no
      end

      def unknown?
        @answer == :unknown
      end
    end
  end
end
