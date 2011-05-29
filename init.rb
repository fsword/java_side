if RUBY_PLATFORM =~ /java/
  require 'java'

  Dir[Rails.root + "java/jars/*.jar"].each{|jar_file|
    require jar_file
    p "load jar: #{jar_file}"
  } if File.exist? Rails.root + "java/jars"
  if File.exist? Rails.root + "java/conf/"
    $CLASSPATH << "java/conf/"
    p "add classpath: java/conf/"
  end
  begin
    if config.respond_to? 'spring'
      require 'java_side/spring' if config.spring
    end
  rescue Exception => e
    $stderr.puts "unknown error - #{e.to_s}"
  end
else
  warn "java_side is only for use with JRuby"
end

