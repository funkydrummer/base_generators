module BaseGenerators
  module Admin
    class ViewGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/view', __FILE__)  
      argument :view_name, type: :string, default: "empty"
      argument :attrs, type: :array, default: :name 

      def generate_admin_view
        template "index.html.haml", "app/views/admin/#{resources}/index.html.haml"  
        template "show.html.haml", "app/views/admin/#{resources}/show.html.haml"  
        template "new.html.haml", "app/views/admin/#{resources}/new.html.haml"  
        template "edit.html.haml", "app/views/admin/#{resources}/edit.html.haml"  
        template "_form.html.haml", "app/views/admin/#{resources}/_form.html.haml"  
      end  

      private  

      def attributes
        attrs.map &:to_sym
      end

      def resource
        view_name.underscore
      end

      def resources
        resource.pluralize
      end
    end 
  end
end
