{ config, pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false;
    
    settings = {
      content = {
        cookies.accept = {
          "chrome-devtools://*" = "all";
          "devtools://*" = "all";
          default = "no-3rdparty";
        };
        headers.accept_language = {
          "https://matchmaker.krunker.io/*" = "";
        };
        headers.user_agent = {
          "https://web.whatsapp.com/" = "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}";
          "https://accounts.google.com/*" = "Mozilla/5.0 ({os_info}; rv:133.0) Gecko/20100101 Firefox/133.0";
        };
        images = {
          "chrome-devtools://*" = true;
          "devtools://*" = true;
        };
        javascript.clipboard = {
          "https://chatgpt.com" = "access-paste";
          "https://github.com" = "access-paste";
          "https://grok.com" = "access-paste";
          "https://replit.com" = "access-paste";
        };
        javascript.enabled = {
          "chrome-devtools://*" = true;
          "devtools://*" = true;
          "chrome://*/*" = true;
          "qute://*/*" = true;
        };
        local_content_can_access_remote_urls = {
          "file:///home/lynx/.local/share/qutebrowser/userscripts/*" = true;
        };
        local_content_can_access_file_urls = {
          "file:///home/lynx/.local/share/qutebrowser/userscripts/*" = false;
        };
        notifications.enabled = {
          "https://www.youtube.com" = false;
        };
        blocking.enabled = false;
      };
      colors.webpage.darkmode.enabled = true;
    };
    
    keyBindings = {
      normal = {
        "M" = "hint links spawn mpv {hint-url}";
      };
    };
  };
}
