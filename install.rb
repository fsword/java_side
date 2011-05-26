require 'ftools'

rails_root=File.dirname(__FILE__)+"/../../../"
asset=File.dirname(__FILE__)+'/install_assets/'

Dir.mkdir rails_root+"config/java" unless File.exist? rails_root+"config/java"
File.copy(asset+'springbeans.xml', rails_root+'config/java',true) unless File.exist? rails_root+'config/java/springbeans.xml'

Dir.mkdir rails_root+"maven_jars/src/main/java"
Dir.mkdir rails_root+"maven_jars/src/test/java"

File.copy(asset+'pom.xml', rails_root+'maven_jars') unless File.exist? rails_root+'maven_jars/pom.xml'

File.copy(asset+file, rails_root+'script',true) unless File.exist? rails_root+'script/start.sh'

