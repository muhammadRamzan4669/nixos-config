{ config, pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false;

    settings = {
      content = {
        blocking.enabled = false;
      };
      colors.webpage.darkmode.enabled = true;
    };

    keyBindings = {
      normal = {
        "M" = "hint links spawn mpv {hint-url}";
        "N" = ''hint links spawn mpv --ytdl-format="bestvideo[height<=720]+bestaudio/best[height<=720]" {hint-url}''; 
      };
    };

    extraConfig = ''
      # Cookie settings
      config.set("content.cookies.accept", "all", "chrome-devtools://*")
      config.set("content.cookies.accept", "all", "devtools://*")

      # Accept-Language header
      config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")

      # User agent settings
      config.set("content.headers.user_agent", "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}", "https://web.whatsapp.com/")
      config.set("content.headers.user_agent", "Mozilla/5.0 ({os_info}; rv:133.0) Gecko/20100101 Firefox/133.0", "https://accounts.google.com/*")

      # Image settings
      config.set("content.images", True, "chrome-devtools://*")
      config.set("content.images", True, "devtools://*")

      # JavaScript clipboard settings
      config.set("content.javascript.clipboard", "access-paste", "https://chatgpt.com")
      config.set("content.javascript.clipboard", "access-paste", "https://github.com")
      config.set("content.javascript.clipboard", "access-paste", "https://grok.com")
      config.set("content.javascript.clipboard", "access-paste", "https://replit.com")

      # JavaScript enabled settings
      config.set("content.javascript.enabled", True, "chrome-devtools://*")
      config.set("content.javascript.enabled", True, "devtools://*")
      config.set("content.javascript.enabled", True, "chrome://*/*")
      config.set("content.javascript.enabled", True, "qute://*/*")

      # Local content access settings
      config.set("content.local_content_can_access_remote_urls", True, "file:///home/lynx/.local/share/qutebrowser/userscripts/*")
      config.set("content.local_content_can_access_file_urls", False, "file:///home/lynx/.local/share/qutebrowser/userscripts/*")

      # Notification settings
      config.set("content.notifications.enabled", False, "https://www.youtube.com")
    '';
  };
}
