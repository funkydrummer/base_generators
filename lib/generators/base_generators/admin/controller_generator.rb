module BaseGenerators
  module Admin
    class ControllerGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/controller', __FILE__)  
      argument :controller_name, type: :string, default: "empty"
      argument :attrs, type: :array, default: [:name] 
      class_option :private_methods, :type => :boolean, :default => true, :description => "Skip private methods"
    
      def generate_controller
        template "controller.rb", "app/controllers/admin/#{resources}_controller.rb"  
      end  

      private  
      
      def attributes
        attrs.map &:to_sym
      end

      def class_name
        controller_name.camelize
      end  

      def resource
        controller_name.underscore
      end
      
      def resources
        resource.pluralize
      end
    end 
  end
end
