require 'ftools'

rails_root=File.expand_path __FILE__+"/../../../.."
asset=File.expand_path __FILE__+'/../install_assets'

p rails_root
p asset

Dir.mkdir rails_root+"/config/java" unless File.exist? rails_root+"/config/java"
File.copy(asset+'/springbeans.xml', rails_root+'/config/java',true) unless File.exist? rails_root+'/config/java/springbeans.xml'

