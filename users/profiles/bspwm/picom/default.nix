{ config, pkgs, ... }:
{
  services.picom = {
    enable = true;

    fade = true;
    fadeDelta = 10;
    fadeSteps = [ 0.06 0.06 ];

    shadow = true;
    shadowOffsets = [ -20 -20 ];
    shadowOpacity = 0.55;

    shadowExclude = [
      "_GTK_FRAME_EXTENTS@:c"
      "class_g = 'firefox' && argb"
      "class_g ?= 'eww-calendar'"
      "class_g ?= 'eww-control-center'"
      "class_g ?= 'eww-info-center'"
      "class_g ?= 'eww-lock-screen'"
      "class_g ?= 'eww-notification-center'"
      "class_g ?= 'eww-notification-popup'"
    ];

    wintypes = {
      dialog = {
        shadow = false;
      };
      dnd = {
        shadow = false;
      };
      dropdown_menu = {
        shadow = false;
      };
      menu = {
        shadow = false;
        full-shadow = true;
      };
      popup_menu = {
        shadow = false;
        full-shadow = true;
      };
      tooltip = {
        fade = true;
        shadow = true;
        full-shadow = false;
      };
      utility = {
        shadow = false;
      };
    };

    backend = "glx";
    vSync = true;
  };
}
