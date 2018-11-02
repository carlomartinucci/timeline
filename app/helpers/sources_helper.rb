module SourcesHelper
  def source_link_to_url source
    return nil if source.nil? || source.url.blank?

    link_to(source.url, "//#{source.url}", target: '_blank')
  end
end
