class ApplicationController < ActionController::Base
  def start_process(name)
    if $robot_pid
      begin
        Process.kill("HUP", $robot_pid)
        Process.wait
      rescue
      ensure
        $robot_pid = nil
      end
    end
    $robot_pid = Process.fork do
      exec(name)
    end
  end
end
