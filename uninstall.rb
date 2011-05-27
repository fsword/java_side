require 'ftools'
require 'fileutils'

rails_root=File.expand_path __FILE__+"/../../../.."

FileUtils.rm_rf rails_root+'/config/java'

FileUtils.rm_rf rails_root+'/jars'

FileUtils.rm_rf rails_root+'/maven'

FileUtils.rm_rf rails_root+'/script/start.sh'
