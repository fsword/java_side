require "active_record"
require "action_view"

# usage:
#   get_bean 
module JavaSide
  module Spring

    def get_bean name
      VALUE.get_bean name
    end

    private
      class Container

        attr_accessor :container

        def initialize
          init!
        end


        def get_bean name
          self.container.getBean(name)
        end

        def destroy
          self.container.destroy if self.container
          self
        end

        def init!
          file = "springbeans_#{Rails.env}.xml"
          p "load #{file}"
          begin
            self.container = org.springframework.context.support.ClassPathXmlApplicationContext.new(file)
          rescue NameError => name_error
            puts "cannot load spring framework.Please check pom.xml and add springframework's library, then re-run: rake java_side:jars "
          rescue Exception => e
            puts "unknown error: #{e.message}"
          end
          self
        end
      end

    VALUE = Container.new
  end
end

ActiveRecord::Base.send :include, JavaSide::Spring
