maintainer "Omar Ramos"
description "Writes a config/secrets.yml file with values injected via your custom JSON' deploy directories."
version "0.1"

recipe "opsworks_rails_secrets::configure", "Write custom configuration and notify rails application to restart upon changes."
recipe "opsworks_rails_secrets::restart_command", "Helper recipe that defines command to restart rails application."
recipe "opsworks_rails_secrets::write_config", "Write a config/secrets.yml file to app's deploy directory. Used by configure recipe, or can be used directly in custom situations."
