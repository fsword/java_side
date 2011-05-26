# usage: 
# include RailsSpring
# get_bean 
require 'singleton'

module RailsSpring

  def get_bean name
    SpringContext.instance.get_bean name
  end

  def refresh
    SpringContext.instance.destroy.init
  end

  def destroy
    SpringContext.instance.destroy
  end

  private
    class SpringContext

      include Singleton
      attr_accessor :container

      def initialize
        file = "springbeans_#{RAILS_ENV}.xml"
        p "load #{file}"
        begin
          self.container = org.springframework.context.support.ClassPathXmlApplicationContext.new(file)
        rescue Exception => e
          p "cannot find spring xml: #{e.message}"
            self.container = org.springframework.context.support.FileSystemXmlApplicationContext.new("#{RAILS_ROOT}/config/java/#{file}")
            end
        end


      def get_bean name
        self.container.getBean(name)
      end

      def destroy
        self.container.destroy if self.container
        self
      end

      def init
        file = "springbeans_#{RAILS_ENV}.xml"
        begin
          self.container = org.springframework.context.support.ClassPathXmlApplicationContext.new(file)
        rescue Exception => e
          p "cannot find spring xml: #{e.message}"
          self.container = org.springframework.context.support.FileSystemXmlApplicationContext.new("#{RAILS_ROOT}/config/java/#{file}")
        end
        self
      end
    end
end

RailsSpring::SpringContext.instance

