require 'realweb/in_thread_server'
require 'realweb/forking_server'

module RealWeb
  class << self
    def start_server_in_thread(*args)
      InThreadServer.new(*args) { |server| server.start }
    end
    alias start_server start_server_in_thread

    def start_server_in_fork(*args)
      ForkingServer.new(*args) { |server| server.start }
    end

    def with_server_in_thread(*args, &block)
      InThreadServer.with_rackup(*args, &block)
    end
    alias with_server with_server_in_thread

    def with_server_in_fork(*args, &block)
      ForkingServer.with_rackup(*args, &block)
    end
  end
end