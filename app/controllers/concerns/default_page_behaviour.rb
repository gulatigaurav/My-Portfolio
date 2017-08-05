module DefaultPageBehaviour
  extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
      def set_page_defaults
        @page_title = "GauravGulati"
        @seo_keywords = "Gaurav Gulati portfolio"
      end
  end
end
