# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

deploy_auth = %w{ user@exmaple.com }
role :app, deploy_auth

set :endive_env, 'production'
set :bundle_jobs, 4

set :rvm_type, :user
set :rvm_ruby_version, '2.2.2@ruby_fias_api'


# Global options
# --------------
set :ssh_options, {
  #keys: %w(/home/rlisowski/.ssh/id_rsa),
  forward_agent: true,
  #auth_methods: %w(password)
}


