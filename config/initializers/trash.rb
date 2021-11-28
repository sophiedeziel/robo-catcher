if defined?(Rails::Server)
  require_relative '../../lib/sequences/trash'
  $trash = Trash.new 
end