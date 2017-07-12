module Docs
  class WebExtensions
    class EntriesFilter < Docs::EntriesFilter
      # We're going to prepend this to name
      API_TYPES = %w(alarms bookmarks browserAction browsingData commands
        contextMenus contextualIdentities cookies devtools.inspectedWindow
        devtools.network devtools.panels downloads events extension
        extensionTypes history i18n identity idle management notifications
        omnibox pageAction permissions privacy proxy runtime sessions
        sidebarAction storage tabs topSites types webNavigation webRequest
        windows)

      # GETTING_STARTED = %w(
      #   What_are_WebExtensions
      #   Your_first_WebExtension
      #   Your_second_WebExtension
      #   Anatomy_of_a_WebExtension
      #   Examples)

      # HOW_TO = %w(
      #   Intercept_HTTP_requests
      #   Modify_a_web_page
      #   Add_a_button_to_the_toolbar
      #   Implemenet_a_settings_page
      #   Interact_with_the_clipboard)

      # CONCEPTS = %w(
      #   Content_scripts
      #   Match_patterns
      #   Internationalization
      #   Content_Security_Policy
      #   Native_messaging
      #   Using_the_devtools_APIs)

      # PORTING = %w(
        # Porting_from_Google_Chrome
        # Porting_a_legacy_Firefox_add-on
        # Embedded_WebExtensions
        # Comparison_with_the_Add-on_SDK
        # Comparison_with_XUL_XPCOM_extensions
        # Chrome_incompatibilities)
#
      # FIREFOX_WORKFLOW = %w(
        # Temporary_Installation_in_Firefox
        # Debugging
        # Getting_started_with_web-ext
        # web-ext_command_reference
        # WebExtensions_and_the_Add-on_ID
        # Publishing_your_WebExtension)
#

      def get_name
        if slug.include? 'API'
          split_slug = slug.split('/')
          if split_slug.size > 2
            _, type, method = split_slug
            type = type ? type.sub(/^A-Z/, &:downcase) : type
            name = type + '.' + method
          else
            name = split_slug.last
          end
        elsif slug.include? 'manifest'
          if slug == 'manifest.json'
            name = 'manifest.json'
          else
            property = slug.split('/').last
            name = 'manifest.'.concat(property)
          end
        else
          name = slug.split('_').join(' ')
        end

        name
      end

      def get_type
        if slug.include? 'manifest'
          type = 'Manifest keys'
        elsif slug.include? 'API'
          type, _ = name.split('.')
        else
          type = 'Miscellaneous'
        end
        type
      end
    end
  end
end
