namespace :java_side do

  task :default => :jars

  desc "编译maven项目，准备相应的jar和class，并通过warbler打包为war"
  task :war => :clean_jars do
    
  end

  desc "清理旧的jar文件"
  task :clean_jars => :environment do
    Dir["#{Rails.root}/java/jars/*.jar"].each{|f| FileUtils.rm f }
  end

  desc "打包java相关部分的jar文件"
  task :jars => :clean_jars do
    `mvn -f java/pom.xml dependency:copy-dependencies`
  end
end
