module ActionView #:nodoc:
  module Helpers #:nodoc:
    module NestedLayoutsHelper
      # Wrap part of the template into layout.
      #
      # If layout doesn't contain '/' then corresponding layout template
      # is searched in default folder ('app/views/layouts'), otherwise
      # it is searched relative to controller's template root directory
      # ('app/views/' by default).
      def inside_layout(layout, &block)
        layout = layout.include?('/') ? layout : "layouts/#{layout}"
        concat(@template.render_file(layout, true, '@content_for_layout' => capture(&block)), block.binding)
      end
    end
  end
end
