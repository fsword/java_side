module JavaSide
  module Warbler
    def self.included(base)
      base.class_eval {
        alias_method :old_after_configure, :after_configure

        def after_configure
          old_after_configure
          config.dirs = %w(app config db lib log vendor tmp)
          config.java_libs     += FileList["java/jars/*.jar"]
          config.java_classes = FileList["java/conf/**/*"]
          config.pathmaps.java_classes << "%{java/conf/,}p"
        end
      }
    end
  end
end

Warbler::Traits::War.send :include, JavaSide::Warbler
