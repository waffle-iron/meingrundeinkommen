PumaWorkerKiller.config do |config|
  config.rolling_restart_frequency = 2 * 3600 # 12 hours in seconds
end
PumaWorkerKiller.start
