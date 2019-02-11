class ApplicationController < ActionController::Base
  def start_process(name)
    $robot_pid = Process.fork do
      exec(name)
    end
  end
end
