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
          file = "springbeans_#{RAILS_ENV}.xml"
          p "load #{file}"
          begin
            self.container = org.springframework.context.support.ClassPathXmlApplicationContext.new(file)
          rescue Exception => e
            p "cannot find spring xml: #{e.message}"
            self.container = org.springframework.context.support.FileSystemXmlApplicationContext.new("config/java/#{file}")
          end
          self
        end
      end

    VALUE = Container.new
  end
end

ActiveRecord::Base.send :include, JavaSide::Spring
