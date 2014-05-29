def git_clone(repo_url, *values)
  options = values.first
  puts "Cloining #{repo_url}"
end

def shell(command)
  Component.log.info("Executing shell command")
  exec(command)
end
