root_dir = File.expand_path('../..', __FILE__)
Eye.config do
  logger "#{root_dir}/log/eye_main.log"
end

Eye.application 'ruby_fias_api' do
  env 'ENDIVE_ENV' => 'production'
  working_dir root_dir
  stdall "log/eye_stdall.log"
  trigger :flapping, times: 10, within: 1.minute, retry_in: 10.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process 'ruby_fias_api_server' do
    pid_file 'tmp/pids/reel.pid' # pid_path will be expanded with the working_dir
    start_command "bundle exec ruby start.rb"

    # when no stop_command or stop_signals, default stop is [:TERM, 0.5, :KILL]
    # default `restart` command is `stop; start`

    daemonize true
  end
end