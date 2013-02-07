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

  describe '#say' do
    it 'delegates to the highline instance' do
      _, _, walkthru = prepare_instance

      walkthru.highline.should_receive(:say).with('fuzzy rabbits')

      walkthru.say('fuzzy rabbits')
    end
  end
end
