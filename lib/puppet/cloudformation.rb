require 'tempfile'
module Puppet::CloudFormation
  class << self
    # created so that an expectation could be set on the
    # executed command
    def execute(command)
      `#{command}`
    end

    # this method exists so that it can be stubbed to return
    # a different template for testing
    def get_pe_cfn_template
      File.join(File.dirname(__FILE__), 'templates', 'pe.erb')
    end
    # this method exists to make it easier to stub this call
    # so that we can capture the path of the generated template
    # for testing
    def get_pe_cfn_tempfile
      Tempfile.new(['cfn-template', '.erb'])
    end
  end
end
