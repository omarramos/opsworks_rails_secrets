# Accepts:
#   application (application name)
#   deploy (hash of deploy attributes)
#   env (hash of custom environment settings)
# 
# Notifies a "restart Rails app <name> for secrets" resource.

define :secrets_template do
  
  template "#{params[:deploy][:deploy_to]}/shared/config/secrets.yml" do
    source "secrets.yml.erb"
    owner params[:deploy][:user]
    group params[:deploy][:group]
    mode "0660"
    variables :env => params[:env]
    notifies :run, resources(:execute => "restart Rails app #{params[:application]} for opsworks rails secrets")

    only_if do
      File.exists?("#{params[:deploy][:deploy_to]}/shared/config")
    end
  end
  
end
