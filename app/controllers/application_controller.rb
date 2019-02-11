class ApplicationController < ActionController::Base
  def start_process(name)
    if $robot_pid
      Process.kill("HUP", $robot_pid)
      Process.wait
      $robot_pid = nil
    end
    $robot_pid = Process.fork do
      exec(name)
    end
  end
end
