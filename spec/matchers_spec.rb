require 'spec_helper'

describe Walkthru::Matchers do
  describe '.yes_no' do
    it 'turns "y" into yes' do
      yn = Walkthru::Matchers.yes_no('y')

      yn.should be_yes
      yn.should_not be_empty
      yn.should_not be_no
      yn.should_not be_unknown
    end

    it 'turns "yes" into yes' do
      yn = Walkthru::Matchers.yes_no('yes')

      yn.should be_yes
      yn.should_not be_empty
      yn.should_not be_no
      yn.should_not be_unknown
    end

    it 'turns "n" into no' do
      yn = Walkthru::Matchers.yes_no('n')

      yn.should_not be_yes
      yn.should_not be_empty
      yn.should be_no
      yn.should_not be_unknown
    end

    it 'turns "no" into no' do
      yn = Walkthru::Matchers.yes_no('no')

      yn.should_not be_yes
      yn.should_not be_empty
      yn.should be_no
      yn.should_not be_unknown
    end

    it 'can identify as empty' do
      yn = Walkthru::Matchers.yes_no('')

      yn.should_not be_yes
      yn.should be_empty
      yn.should_not be_no
      yn.should_not be_unknown
    end

    it 'treats just whitespace as unknown, not empty' do
      yn = Walkthru::Matchers.yes_no('  ')

      yn.should_not be_yes
      yn.should_not be_empty
      yn.should_not be_no
      yn.should be_unknown
    end

    it 'treats gibberish as unknown' do
      yn = Walkthru::Matchers.yes_no('asdf')

      yn.should_not be_yes
      yn.should_not be_empty
      yn.should_not be_no
      yn.should be_unknown
    end

    it 'is unknown if they keep typing after "yes" or "no"' do
      yesterday = Walkthru::Matchers.yes_no('yesterday')
      yesterday.should be_unknown
      yesterday.should_not be_empty
      yesterday.should_not be_yes
      yesterday.should_not be_no

      nothing = Walkthru::Matchers.yes_no('nothing')
      nothing.should be_unknown
      nothing.should_not be_empty
      nothing.should_not be_yes
      nothing.should_not be_no
    end
  end
end
