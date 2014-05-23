# Set up app's custom configuration in the environment.
# See https://forums.aws.amazon.com/thread.jspa?threadID=118107

node[:deploy].each do |application, deploy|
  
  secrets_template do
    application application
    deploy deploy
    env node[:secrets][application]
  end
  
end
