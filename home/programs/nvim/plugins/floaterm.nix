{ config, ... }: {
  programs.nixvim = {
    plugins.floaterm.enable = true;
    keymaps = [{
      key = "<leader>cn";
      action =
        "<cmd>FloatermNew --wintype=split --height=20 --title=nixy --autoclose=0 nixy<cr>";
      options.desc = "Nixy";
    }];
  };
}
