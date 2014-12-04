if node[:opsworks][:instance][:layers].include?('rails-app')
  include_recipe "opsworks_rails_secrets::restart_command"
end

include_recipe "opsworks_rails_secrets::write_config"
