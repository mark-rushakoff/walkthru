require 'spec_helper'

describe Walkthru::Instance do
  describe '#highline' do
    it 'should be an instance of HighLine' do
      _, _, walkthru = prepare_instance

      walkthru.highline.should be_a(HighLine)
    end
  end

  describe '#instruct' do
    it 'consumes a newline' do
      stdin, stdout, walkthru = prepare_instance
      stdin.write "\n"
      stdin.rewind

      walkthru.instruct 'Open any website in your browser'

      stdout.string.should match /Open any website in your browser/
      stdout.string.should match /^\[Press ENTER to continue\]$/

      stdin.should be_eof
    end
  end

  describe '#yes_no' do
    it 'asks the question' do
      stdin, stdout, walkthru = prepare_instance
      stdin.write("\n")
      stdin.rewind

      walkthru.yes_no 'some question here'

      stdout.string.should include 'some question here [Yn]'
    end

    it 'treats y as true' do
      stdin, _, walkthru = prepare_instance
      stdin.write "y\n"
      stdin.rewind

      walkthru.yes_no('whatever').should be_true
    end

    it 'treats n as false' do
      stdin, _, walkthru = prepare_instance
      stdin.write "n\n"
      stdin.rewind

      walkthru.yes_no('whatever').should be_false
    end

    it 'defaults to true' do
      stdin, _, walkthru = prepare_instance
      stdin.write "\n"
      stdin.rewind

      walkthru.yes_no('').should be_true
    end
  end

  describe '#no_yes' do
    it 'asks the question' do
      stdin, stdout, walkthru = prepare_instance
      stdin.write("\n")
      stdin.rewind

      walkthru.no_yes 'some question here'

      stdout.string.should include 'some question here [yN]'
    end

    it 'treats y as true' do
      stdin, _, walkthru = prepare_instance
      stdin.write "y\n"
      stdin.rewind

      walkthru.no_yes('whatever').should be_true
    end

    it 'treats n as false' do
      stdin, _, walkthru = prepare_instance
      stdin.write "n\n"
      stdin.rewind

      walkthru.no_yes('whatever').should be_false
    end

    it 'defaults to false' do
      stdin, _, walkthru = prepare_instance
      stdin.write "\n"
      stdin.rewind

      walkthru.no_yes('whatever').should be_false
    end
  end

  describe '#say' do
    it 'delegates to the highline instance' do
      _, _, walkthru = prepare_instance

      walkthru.highline.should_receive(:say).with('fuzzy rabbits')

      walkthru.say('fuzzy rabbits')
    end
  end
end
