module Rack
  class CommonLogger
  	FORMAT = %{%s%s %s %s %s\n}

  	def log(env, status, header, began_at)
      path = env[PATH_INFO] == "/slow_IO" ? "/slow_IO " : env[PATH_INFO]

      msg = FORMAT % [
        env[REQUEST_METHOD],
        path,
        env[QUERY_STRING].empty? ? "" : "?#{env[QUERY_STRING]}",
        "begin: #{began_at.strftime('%H:%M:%S:%3N')}",
        "now: #{Time.now.strftime('%H:%M:%S:%3N')}, took: #{Time.now - began_at}" 
    	]

      logger = @logger || env['rack.errors']
      if logger.respond_to?(:write)
        logger.write(msg)
      else
        logger << msg
    	end
  	end
  end
end