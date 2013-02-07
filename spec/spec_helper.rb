require 'bundler/setup'
require 'walkthru'

RSpec.configure do |c|

end

def prepare_instance
  stdin = StringIO.new
  stdout = StringIO.new
  walkthru = Walkthru.create(stdin: stdin, stdout: stdout)

  [stdin, stdout, walkthru]
end

def eof_ok &block
  begin
    block.call
  rescue EOFError
  end
end
