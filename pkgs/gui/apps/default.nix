{ pkgs }:

# expose a set of apps you can refer to as guiApps.foo
{
  kate       = pkgs.kate;
  vlc        = pkgs.vlc;
  gimp       = pkgs.gimp;
  # …and any overriden/custom apps
}
