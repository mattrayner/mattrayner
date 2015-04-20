namespace :bundler do
  desc 'build bundler config for pg gem'
  task :build do
    on roles(:app) do
      execute 'bundle config build.pg --with-pg-config=/usr/pgsql-9.4/bin/pg_config'
    end
  end
end