{ pkgs }:

# expose a set of apps you can refer to as guiApps.foo
{
  kate       = pkgs.kate;
  vlc        = pkgs.vlc;
  gimp       = pkgs.gimp;

  foot       = pkgs.foot;
  waybar     = pkgs.waybar;
  wofi       = pkgs.wofi;
  # …and any overriden/custom apps
}
