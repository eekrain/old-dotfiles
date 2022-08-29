{ config, ... }:
{

  xdg = {
    enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;

    desktopEntries = {
      whatsapp = {
        name = "WhatsApp";
        genericName = "WhatsApp";
        comment = "WhatsApp Desktop Webapp";
        exec = "brave --disable-extensions --start-maximized --app=https://web.whatsapp.com";
        type = "Application";
        terminal = false;
        startupNotify = true;
        categories = [ "Network" ];
        mimeType = [ "text/plain" ];
        settings = {
          Keywords = "WhatsApp;webapp;";
          X-Ubuntu-Gettext-Domain = "WhatsApp";
          StartupWMClass = "web.whatsapp.com";
        };
      };
    };
  };
}
