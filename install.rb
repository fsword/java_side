require 'ftools'

rails_root=File.expand_path __FILE__+"/../../../.."
asset=File.expand_path __FILE__+'/../install_assets'

Dir.mkdir rails_root+"/config/java" unless File.exist? rails_root+"/config/java"
Dir.mkdir rails_root+"/maven_jars" unless File.exist? rails_root+"/maven_jars"

File.copy(asset+'/springbeans.xml', rails_root+'/config/java',true) unless File.exist? rails_root+'/config/java/springbeans.xml'

File.copy(asset+'/pom.xml', rails_root+'/maven_jars') unless File.exist? rails_root+'/maven_jars/pom.xml'

File.copy(asset+'/start.sh', rails_root+'/script',true) unless File.exist? rails_root+'/script/start.sh'

