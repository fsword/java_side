if RUBY_PLATFORM =~ /java/
  Dir[RAILS_ROOT + "/jars/*.jar"].each{|jar_file|
    require jar_file
    p "load jar: #{jar_file}"
  } if File.exist? RAILS_ROOT + "/jars"
  begin
    require 'java_side'
  rescue Exception => e
    $stderr.puts "cannot load java classes - #{e.to_s}"
  end
else
  warn "java_side is only for use with JRuby"
end

