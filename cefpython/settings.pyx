# Copyright (c) 2012 CefPython Authors. All rights reserved.
# License: New BSD License.
# Website: http://code.google.com/p/cefpython/

IF CEF_VERSION == 3:
    LOGSEVERITY_DEFAULT = <int>cef_types.LOGSEVERITY_DEFAULT
LOGSEVERITY_VERBOSE = <int>cef_types.LOGSEVERITY_VERBOSE
LOGSEVERITY_INFO = <int>cef_types.LOGSEVERITY_INFO
LOGSEVERITY_WARNING = <int>cef_types.LOGSEVERITY_WARNING
LOGSEVERITY_ERROR = <int>cef_types.LOGSEVERITY_ERROR
LOGSEVERITY_ERROR_REPORT = <int>cef_types.LOGSEVERITY_ERROR_REPORT
LOGSEVERITY_DISABLE = <int>cef_types.LOGSEVERITY_DISABLE

IF UNAME_SYSNAME == "Windows":
    IF CEF_VERSION == 1:
        ANGLE_IN_PROCESS = <int>cef_types_win.ANGLE_IN_PROCESS
        ANGLE_IN_PROCESS_COMMAND_BUFFER = <int>cef_types_win.ANGLE_IN_PROCESS_COMMAND_BUFFER
        DESKTOP_IN_PROCESS = <int>cef_types_win.DESKTOP_IN_PROCESS
        DESKTOP_IN_PROCESS_COMMAND_BUFFER = <int>cef_types_win.DESKTOP_IN_PROCESS_COMMAND_BUFFER

cdef void SetApplicationSettings(appSettings, CefSettings* cefAppSettings) except *:

    cdef CefString* cefString

    for key in appSettings:

        # Setting string: CefString(&browserDefaults.default_encoding).FromASCII("UTF-8");
        # cefString = CefString(&cefSettings.user_agent)
        # cefString.FromASCII(<char*>settings[key])

        IF CEF_VERSION == 1:

            if key == "unicode_to_bytes_encoding":
                # cefpython internal option
                continue
            elif key == "multi_threaded_message_loop":
                cefAppSettings.multi_threaded_message_loop = bool(appSettings[key])
            elif key == "cache_path":
                cefString = new CefString(&cefAppSettings.cache_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "user_agent":
                cefString = new CefString(&cefAppSettings.user_agent)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "product_version":
                cefString = new CefString(&cefAppSettings.product_version)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "log_file":
                cefString = new CefString(&cefAppSettings.log_file)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "locale":
                cefString = new CefString(&cefAppSettings.locale)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "log_severity":
                cefAppSettings.log_severity = <cef_types.cef_log_severity_t><int>int(appSettings[key])
            elif key == "release_dcheck_enabled":
                cefAppSettings.release_dcheck_enabled = bool(appSettings[key])
            elif key == "graphics_implementation" and platform.system() == "Windows":
                cefAppSettings.graphics_implementation = <cef_types_win.cef_graphics_implementation_t?><int>int(appSettings[key])
            elif key == "local_storage_quota":
                cefAppSettings.local_storage_quota = <int>int(appSettings[key])
            elif key == "session_storage_quota":
                cefAppSettings.session_storage_quota = <int>int(appSettings[key])
            elif key == "javascript_flags":
                cefString = new CefString(&cefAppSettings.javascript_flags)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "auto_detect_proxy_settings_enabled":
                IF UNAME_SYSNAME == "Windows":
                    cefAppSettings.auto_detect_proxy_settings_enabled = bool(appSettings[key])
                ELSE:
                    raise Exception("auto_detect_proxy_settings_enabled is a Windows-only option")
            elif key == "resources_dir_path":
                cefString = new CefString(&cefAppSettings.resources_dir_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "locales_dir_path":
                cefString = new CefString(&cefAppSettings.locales_dir_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "pack_loading_disabled":
                cefAppSettings.pack_loading_disabled = bool(appSettings[key])
            elif key == "uncaught_exception_stack_size":
                cefAppSettings.uncaught_exception_stack_size = <int>int(appSettings[key])
            else:
                raise Exception("Invalid appSettings key: %s" % key)

        ELIF CEF_VERSION == 3:

            if key == "unicode_to_bytes_encoding":
                # cefpython internal option
                continue
            elif key == "multi_threaded_message_loop":
                cefAppSettings.multi_threaded_message_loop = bool(appSettings[key])
            elif key == "cache_path":
                cefString = new CefString(&cefAppSettings.cache_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "user_agent":
                cefString = new CefString(&cefAppSettings.user_agent)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "product_version":
                cefString = new CefString(&cefAppSettings.product_version)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "log_file":
                cefString = new CefString(&cefAppSettings.log_file)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "locale":
                cefString = new CefString(&cefAppSettings.locale)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "log_severity":
                cefAppSettings.log_severity = <cef_types.cef_log_severity_t><int>int(appSettings[key])
            elif key == "release_dcheck_enabled":
                cefAppSettings.release_dcheck_enabled = bool(appSettings[key])
            elif key == "javascript_flags":
                cefString = new CefString(&cefAppSettings.javascript_flags)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "auto_detect_proxy_settings_enabled":
                cefAppSettings.auto_detect_proxy_settings_enabled = bool(appSettings[key])
            elif key == "resources_dir_path":
                cefString = new CefString(&cefAppSettings.resources_dir_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "locales_dir_path":
                cefString = new CefString(&cefAppSettings.locales_dir_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "pack_loading_disabled":
                cefAppSettings.pack_loading_disabled = bool(appSettings[key])
            elif key == "uncaught_exception_stack_size":
                cefAppSettings.uncaught_exception_stack_size = <int>int(appSettings[key])
            elif key == "single_process":
                cefAppSettings.single_process = bool(appSettings[key])
            elif key == "browser_subprocess_path":
                cefString = new CefString(&cefAppSettings.browser_subprocess_path)
                ToCefStringPointer(appSettings[key], cefString)
                del cefString
            elif key == "command_line_args_disabled":
                cefAppSettings.command_line_args_disabled = bool(appSettings[key])
            elif key == "remote_debugging_port":
                cefAppSettings.remote_debugging_port = int(appSettings[key])
            else:
                raise Exception("Invalid appSettings key: %s" % key)



cdef void SetBrowserSettings(browserSettings, CefBrowserSettings* cefBrowserSettings) except *:

    cdef CefString* cefString

    for key in browserSettings:

        IF CEF_VERSION == 1:

            if key == "animation_frame_rate":
                cefBrowserSettings.animation_frame_rate = bool(browserSettings[key])
            elif key == "drag_drop_disabled":
                cefBrowserSettings.drag_drop_disabled = bool(browserSettings[key])
            elif key == "load_drops_disabled":
                cefBrowserSettings.load_drops_disabled = bool(browserSettings[key])
            elif key == "history_disabled":
                cefBrowserSettings.history_disabled = bool(browserSettings[key])
            elif key == "standard_font_family":
                cefString = new CefString(&cefBrowserSettings.standard_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "fixed_font_family":
                cefString = new CefString(&cefBrowserSettings.fixed_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "serif_font_family":
                cefString = new CefString(&cefBrowserSettings.serif_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "sans_serif_font_family":
                cefString = new CefString(&cefBrowserSettings.sans_serif_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "cursive_font_family":
                cefString = new CefString(&cefBrowserSettings.cursive_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "fantasy_font_family":
                cefString = new CefString(&cefBrowserSettings.fantasy_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "default_font_size":
                cefBrowserSettings.default_font_size = <int>int(browserSettings[key])
            elif key == "default_fixed_font_size":
                cefBrowserSettings.default_fixed_font_size = <int>int(browserSettings[key])
            elif key == "minimum_font_size":
                cefBrowserSettings.minimum_font_size = <int>int(browserSettings[key])
            elif key == "minimum_logical_font_size":
                cefBrowserSettings.minimum_logical_font_size = <int>int(browserSettings[key])
            elif key == "remote_fonts_disabled":
                cefBrowserSettings.remote_fonts_disabled = bool(browserSettings[key])
            elif key == "default_encoding":
                cefString = new CefString(&cefBrowserSettings.default_encoding)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "encoding_detector_enabled":
                cefBrowserSettings.encoding_detector_enabled = bool(browserSettings[key])
            elif key == "javascript_disabled":
                cefBrowserSettings.javascript_disabled = bool(browserSettings[key])
            elif key == "javascript_open_windows_disallowed":
                cefBrowserSettings.javascript_open_windows_disallowed = bool(browserSettings[key])
            elif key == "javascript_close_windows_disallowed":
                cefBrowserSettings.javascript_close_windows_disallowed = bool(browserSettings[key])
            elif key == "javascript_access_clipboard_disallowed":
                cefBrowserSettings.javascript_access_clipboard_disallowed = bool(browserSettings[key])
            elif key == "dom_paste_disabled":
                cefBrowserSettings.dom_paste_disabled = bool(browserSettings[key])
            elif key == "caret_browsing_enabled":
                cefBrowserSettings.caret_browsing_enabled = bool(browserSettings[key])
            elif key == "java_disabled":
                cefBrowserSettings.java_disabled = bool(browserSettings[key])
            elif key == "plugins_disabled":
                cefBrowserSettings.plugins_disabled = bool(browserSettings[key])
            elif key == "universal_access_from_file_urls_allowed":
                cefBrowserSettings.universal_access_from_file_urls_allowed = bool(browserSettings[key])
            elif key == "file_access_from_file_urls_allowed":
                cefBrowserSettings.file_access_from_file_urls_allowed = bool(browserSettings[key])
            elif key == "web_security_disabled":
                cefBrowserSettings.web_security_disabled = bool(browserSettings[key])
            elif key == "xss_auditor_enabled":
                cefBrowserSettings.xss_auditor_enabled = bool(browserSettings[key])
            elif key == "image_load_disabled":
                cefBrowserSettings.image_load_disabled = bool(browserSettings[key])
            elif key == "shrink_standalone_images_to_fit":
                cefBrowserSettings.shrink_standalone_images_to_fit = bool(browserSettings[key])
            elif key == "site_specific_quirks_disabled":
                cefBrowserSettings.site_specific_quirks_disabled = bool(browserSettings[key])
            elif key == "text_area_resize_disabled":
                cefBrowserSettings.text_area_resize_disabled = bool(browserSettings[key])
            elif key == "page_cache_disabled":
                cefBrowserSettings.page_cache_disabled = bool(browserSettings[key])
            elif key == "tab_to_links_disabled":
                cefBrowserSettings.tab_to_links_disabled = bool(browserSettings[key])
            elif key == "hyperlink_auditing_disabled":
                cefBrowserSettings.hyperlink_auditing_disabled = bool(browserSettings[key])
            elif key == "user_style_sheet_enabled":
                cefBrowserSettings.user_style_sheet_enabled = bool(browserSettings[key])
            elif key == "user_style_sheet_location":
                cefString = new CefString(&cefBrowserSettings.user_style_sheet_location)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "author_and_user_styles_disabled":
                cefBrowserSettings.author_and_user_styles_disabled = bool(browserSettings[key])
            elif key == "local_storage_disabled":
                cefBrowserSettings.local_storage_disabled = bool(browserSettings[key])
            elif key == "databases_disabled":
                cefBrowserSettings.databases_disabled = bool(browserSettings[key])
            elif key == "application_cache_disabled":
                cefBrowserSettings.application_cache_disabled = bool(browserSettings[key])
            elif key == "webgl_disabled":
                cefBrowserSettings.webgl_disabled = bool(browserSettings[key])
            elif key == "accelerated_compositing_enabled":
                cefBrowserSettings.accelerated_compositing_enabled = bool(browserSettings[key])
            elif key == "accelerated_layers_disabled":
                cefBrowserSettings.accelerated_layers_disabled = bool(browserSettings[key])
            elif key == "accelerated_video_disabled":
                cefBrowserSettings.accelerated_video_disabled = bool(browserSettings[key])
            elif key == "accelerated_2d_canvas_disabled":
                cefBrowserSettings.accelerated_2d_canvas_disabled = bool(browserSettings[key])
            elif key == "accelerated_painting_disabled":
                cefBrowserSettings.accelerated_painting_disabled = bool(browserSettings[key])
            elif key == "accelerated_filters_disabled":
                cefBrowserSettings.accelerated_filters_disabled = bool(browserSettings[key])
            elif key == "accelerated_plugins_disabled":
                cefBrowserSettings.accelerated_plugins_disabled = bool(browserSettings[key])
            elif key == "developer_tools_disabled":
                cefBrowserSettings.developer_tools_disabled = bool(browserSettings[key])
            elif key == "fullscreen_enabled":
                cefBrowserSettings.fullscreen_enabled = bool(browserSettings[key])
            else:
                raise Exception("Invalid browserSettings key: %s" % key)

        ELIF CEF_VERSION == 3:

            if key == "standard_font_family":
                cefString = new CefString(&cefBrowserSettings.standard_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "fixed_font_family":
                cefString = new CefString(&cefBrowserSettings.fixed_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "serif_font_family":
                cefString = new CefString(&cefBrowserSettings.serif_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "sans_serif_font_family":
                cefString = new CefString(&cefBrowserSettings.sans_serif_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "cursive_font_family":
                cefString = new CefString(&cefBrowserSettings.cursive_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "fantasy_font_family":
                cefString = new CefString(&cefBrowserSettings.fantasy_font_family)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "default_font_size":
                cefBrowserSettings.default_font_size = <int>int(browserSettings[key])
            elif key == "default_fixed_font_size":
                cefBrowserSettings.default_fixed_font_size = <int>int(browserSettings[key])
            elif key == "minimum_font_size":
                cefBrowserSettings.minimum_font_size = <int>int(browserSettings[key])
            elif key == "minimum_logical_font_size":
                cefBrowserSettings.minimum_logical_font_size = <int>int(browserSettings[key])
            elif key == "remote_fonts_disabled":
                cefBrowserSettings.remote_fonts_disabled = bool(browserSettings[key])
            elif key == "default_encoding":
                cefString = new CefString(&cefBrowserSettings.default_encoding)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "encoding_detector_enabled":
                cefBrowserSettings.encoding_detector_enabled = bool(browserSettings[key])
            elif key == "javascript_disabled":
                cefBrowserSettings.javascript_disabled = bool(browserSettings[key])
            elif key == "javascript_open_windows_disallowed":
                cefBrowserSettings.javascript_open_windows_disallowed = bool(browserSettings[key])
            elif key == "javascript_close_windows_disallowed":
                cefBrowserSettings.javascript_close_windows_disallowed = bool(browserSettings[key])
            elif key == "javascript_access_clipboard_disallowed":
                cefBrowserSettings.javascript_access_clipboard_disallowed = bool(browserSettings[key])
            elif key == "dom_paste_disabled":
                cefBrowserSettings.dom_paste_disabled = bool(browserSettings[key])
            elif key == "caret_browsing_enabled":
                cefBrowserSettings.caret_browsing_enabled = bool(browserSettings[key])
            elif key == "java_disabled":
                cefBrowserSettings.java_disabled = bool(browserSettings[key])
            elif key == "plugins_disabled":
                cefBrowserSettings.plugins_disabled = bool(browserSettings[key])
            elif key == "universal_access_from_file_urls_allowed":
                cefBrowserSettings.universal_access_from_file_urls_allowed = bool(browserSettings[key])
            elif key == "file_access_from_file_urls_allowed":
                cefBrowserSettings.file_access_from_file_urls_allowed = bool(browserSettings[key])
            elif key == "web_security_disabled":
                cefBrowserSettings.web_security_disabled = bool(browserSettings[key])
            elif key == "xss_auditor_enabled":
                cefBrowserSettings.xss_auditor_enabled = bool(browserSettings[key])
            elif key == "image_load_disabled":
                cefBrowserSettings.image_load_disabled = bool(browserSettings[key])
            elif key == "shrink_standalone_images_to_fit":
                cefBrowserSettings.shrink_standalone_images_to_fit = bool(browserSettings[key])
            elif key == "site_specific_quirks_disabled":
                cefBrowserSettings.site_specific_quirks_disabled = bool(browserSettings[key])
            elif key == "text_area_resize_disabled":
                cefBrowserSettings.text_area_resize_disabled = bool(browserSettings[key])
            elif key == "page_cache_disabled":
                cefBrowserSettings.page_cache_disabled = bool(browserSettings[key])
            elif key == "tab_to_links_disabled":
                cefBrowserSettings.tab_to_links_disabled = bool(browserSettings[key])
            elif key == "hyperlink_auditing_disabled":
                cefBrowserSettings.hyperlink_auditing_disabled = bool(browserSettings[key])
            elif key == "user_style_sheet_enabled":
                cefBrowserSettings.user_style_sheet_enabled = bool(browserSettings[key])
            elif key == "user_style_sheet_location":
                cefString = new CefString(&cefBrowserSettings.user_style_sheet_location)
                ToCefStringPointer(browserSettings[key], cefString)
                del cefString
            elif key == "author_and_user_styles_disabled":
                cefBrowserSettings.author_and_user_styles_disabled = bool(browserSettings[key])
            elif key == "local_storage_disabled":
                cefBrowserSettings.local_storage_disabled = bool(browserSettings[key])
            elif key == "databases_disabled":
                cefBrowserSettings.databases_disabled = bool(browserSettings[key])
            elif key == "application_cache_disabled":
                cefBrowserSettings.application_cache_disabled = bool(browserSettings[key])
            elif key == "webgl_disabled":
                cefBrowserSettings.webgl_disabled = bool(browserSettings[key])
            elif key == "accelerated_compositing_disabled":
                cefBrowserSettings.accelerated_compositing_disabled = bool(browserSettings[key])
            elif key == "accelerated_layers_disabled":
                cefBrowserSettings.accelerated_layers_disabled = bool(browserSettings[key])
            elif key == "accelerated_video_disabled":
                cefBrowserSettings.accelerated_video_disabled = bool(browserSettings[key])
            elif key == "accelerated_2d_canvas_disabled":
                cefBrowserSettings.accelerated_2d_canvas_disabled = bool(browserSettings[key])
            elif key == "accelerated_painting_enabled":
                cefBrowserSettings.accelerated_painting_enabled = bool(browserSettings[key])
            elif key == "accelerated_filters_disabled":
                cefBrowserSettings.accelerated_filters_enabled = bool(browserSettings[key])
            elif key == "accelerated_plugins_enabled":
                cefBrowserSettings.accelerated_plugins_disabled = bool(browserSettings[key])
            elif key == "developer_tools_disabled":
                cefBrowserSettings.developer_tools_disabled = bool(browserSettings[key])
            elif key == "fullscreen_enabled":
                cefBrowserSettings.fullscreen_enabled = bool(browserSettings[key])
            else:
                raise Exception("Invalid browserSettings key: %s" % key)