require 'ftools'
require 'fileutils'

rails_root=File.expand_path __FILE__+"/../../../.."

FileUtils.rm_rf rails_root+'/java'

