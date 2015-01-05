module BaseGenerators
  module Admin
    class ViewGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/view', __FILE__)
      argument :view_name, type: :string, default: "empty"
      argument :attrs, type: :array, default: [:name, :description]
      class_option :index, type: :boolean, default: true, description: "Skip index"
      class_option :show, type: :boolean, default: true, description: "Skip show"
      class_option :new, type: :boolean, default: true, description: "Skip new"
      class_option :edit, type: :boolean, default: true, description: "Skip edit"
      class_option :form, type: :boolean, default: true, description: "Skip form"

      def generate_view
        template "index.html.haml", "app/views/admin/#{resources}/index.html.haml" if options.index?
        template "show.html.haml", "app/views/admin/#{resources}/show.html.haml" if options.show?
        template "new.html.haml", "app/views/admin/#{resources}/new.html.haml" if options.new?
        template "edit.html.haml", "app/views/admin/#{resources}/edit.html.haml" if options.edit?
        template "_form.html.haml", "app/views/admin/#{resources}/_form.html.haml" if options.form?
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
