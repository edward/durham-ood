loop do
  sleep 2
  fork do
    exec 'rake'
  end
end