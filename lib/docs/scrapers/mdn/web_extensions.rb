module Docs
  class WebExtensions < Mdn
    # prepend FixInternalUrlsBehavior
    # prepend FixRedirectionsBehavior

    self.name = 'WebExtensions'
    self.slug = 'web_extensions'
    self.base_url = 'https://developer.mozilla.org/en-US/Add-ons/WebExtensions'

    # 'web_extensions/clean_html',
    html_filters.push 'mdn/clean_html',  'web_extensions/entries', 'title'

    options[:root_title] = 'WebExtensions'
    options[:only_pattern] = [/API/,]

    # options[:fix_urls] = ->(url) do
      # # url.sub! 'https://developer.mozilla.org/en-US/docs/Add-ons/WebExtensions', "#{WebExtensions.base_url}"
    # end

    # options[:replace_paths] = {
      # '/manifest.json' => '/manifest'
    # }

  end
end
