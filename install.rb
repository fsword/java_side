require 'ftools'

rails_root=File.expand_path __FILE__+"/../../../.."
asset=File.expand_path __FILE__+'/../install_assets'

p rails_root
p asset

Dir.mkdir rails_root+"/config/java" unless File.exist? rails_root+"/config/java"
File.copy(asset+'/springbeans.xml', rails_root+'/config/java',true) unless File.exist? rails_root+'/config/java/springbeans.xml'

p 'x'

Dir.mkdir rails_root+"/maven_jars" unless File.exist? rails_root+"/maven_jars"

p 'a'

File.copy(asset+'/pom.xml', rails_root+'/maven_jars') unless File.exist? rails_root+'/maven_jars/pom.xml'

p 'b'

File.copy(asset+file, rails_root+'/script',true) unless File.exist? rails_root+'/script/start.sh'

