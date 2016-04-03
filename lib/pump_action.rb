require "listen"
require "rack"

require "pump_action/version"

module PumpAction
  class Runner
    attr_reader :child_pid, :paths

    FILETYPES = /\.(erb|rb)$/

    def initialize(config)
      @rack_file = config[:rack_file]
      paths = config[:listen_to] || []
      @port = config[:port] || 9292
      set_traps!
      @listener = Listen.to(*paths, only: FILETYPES) do |modified, added, removed|
        restart_child!
      end
    end

    def run
      @listener.start
      start_child!
      sleep(99999) while true
    end

    def stop
      exit_child!
    end

    private

    def exit_child!
      if @child_pid
        puts "Killing child with PID #{@child_pid}"
        Process.kill 9, @child_pid
        Process.wait @child_pid
        puts "Child with PID #{@child_pid} is dead"
        @child_pid = nil
      end
    end

    def start_child!
      @child_pid = fork do
        app = Rack::Builder.parse_file(@rack_file).first
        Rack::Handler::WEBrick.run(app, Port: @port)
      end
      puts "Restarted child with PID #{@child_pid}"
    end

    def restart_child!
      exit_child!
      start_child!
    end

    def set_traps!
      ["INT", "TERM", "QUIT"].each do |signal|
        trap(signal) do
          exit_child!
          exit!
        end
      end
    end
  end
end
