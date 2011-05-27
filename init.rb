if RUBY_PLATFORM =~ /java/
  Dir[Rails.root + "/jars/*.jar"].each{|jar_file|
    require jar_file
    p "load jar: #{jar_file}"
  } if File.exist? Rails.root + "/jars"
  $CLASSPATH << "config/java/" if File.exist? Rails.root + "config/java"
  begin
    require 'java_side'
  rescue Exception => e
    $stderr.puts "cannot load java classes - #{e.to_s}"
  end
else
  warn "java_side is only for use with JRuby"
end

