require 'ftools'

rails_root=File.dirname(__FILE__)+"/../../../"

FileUtils.rm_rf rails_root+'config/java'

FileUtils.rm_rf rails_root+'maven_jars'

FileUtils.rm_rf rails_root+'script/start.sh'
