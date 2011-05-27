require 'ftools'
require 'fileutils'

rails_root=File.expand_path __FILE__+"/../../../.."
asset=File.expand_path __FILE__+'/../install_assets'

Dir.mkdir rails_root+"/config/java" unless File.exist? rails_root+"/config/java"
Dir.mkdir rails_root+"/jars" unless File.exist? rails_root+"/jars"
FileUtils.mkdir_p rails_root+"/maven/src/test/java" unless File.exist? rails_root+"/maven/src/test/java"
FileUtils.mkdir_p rails_root+"/maven/src/main/java" unless File.exist? rails_root+"/maven/src/main/java"

%w{development test production}.each{|env|
  File.copy(asset+'/springbeans.xml', "#{rails_root}/config/java/springbeans_#{env}.xml",true)
}

File.copy(asset+'/pom.xml', rails_root+'/maven') unless File.exist? rails_root+'/maven/pom.xml'

File.copy(asset+'/start.sh', rails_root+'/script',true) unless File.exist? rails_root+'/script/start.sh'

