{ lib, pkgs, config, inputs, ... }:

let
  cfg = config.helix-config;
in
{
  options.helix-config = {
    enable = lib.mkEnableOption "Enable helix config";
  };

  config = lib.mkIf cfg.enable {
    programs.helix = {
      package = inputs.helix.packages.${pkgs.stdenv.system}.default;
      enable = true;
      defaultEditor = true;

      settings = {
        theme = "custom";
        editor = {
          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          end-of-line-diagnostics = "hint";
          inline-diagnostics = {
            cursor-line = "warning";
          };
        };
      };

      themes = {
        custom = let
          white = "#dcd7ba";
          gray1 = "#1F1F28";
          gray2 = "#252530";
          gray3 = "#2A2A37";
          gray4 = "#363646";
          gray5 = "#54546D";
          gray6 = "#707070";
          black = "#121212";
          red = "#ff7e70";
          dark-red = "#5e120f";
          light-red = "#ffbdb2";
          cyan = "#00c5ad";
          yellow = "#e9c27c";
          dark-yellow = "#49443c";
          green = "#76946a";
          dark-green = "#2b3328";
          light-green = "#b2dd7c";
          purple = "#b187c8";
          violet = "#9cabca";
          blue = "#00c9ff";
          dark-blue = "#252e42";
          light-blue = "#7fb4ca";
          selection-blue = "#2A3D5A";
          pink = "#ff89ca";
          orange = "#e99502";
        in {
          "type" = yellow;
          "constant" = pink;
          "constant.numeric" = pink;
          "constant.character.escape" = orange;
          "string" = green;
          "string.regexp" = blue;
          "comment" = gray6;
          "variable" = white;
          "variable.builtin" = light-blue;
          "variable.parameter" = white;
          "label" = light-blue;
          "punctuation" = gray6;
          "punctuation.delimiter" = gray6;
          "punctuation.bracket" = white;
          "keyword" = purple;
          "keyword.control" = red;
          "keyword.control.exception" = red;
          "keyword.control.return" = red;
          "keyword.directive" = red;
          "keyword.function" = red;
          "operator" = yellow;
          "function" = light-green;
          "function.builtin" = light-blue;
          "function.macro" = light-blue;
          "tag" = yellow;
          "namespace" = light-blue;
          "module" = light-blue;
          "attribute" = light-blue;
          "constructor" = yellow;
          "special" = orange;

          "diff.plus" = { fg = green; bg = dark-green; };
          "diff.delta" = { fg = yellow; bg = dark-yellow; };
          "diff.minus" = { fg = red; bg = dark-red; };

          "hint" = light-blue;
          "info" = light-blue;
          "warning" = yellow;
          "error" = red;
          "diagnostic" = { underline = { style = "line"; }; };
          "diagnostic.hint" = { underline = { color = light-blue; style = "dotted"; }; };
          "diagnostic.info" = { underline = { color = light-blue; style = "dotted"; }; };
          "diagnostic.warning" = { underline = { color = yellow; style = "curl"; }; };
          "diagnostic.error" = { underline = { color = red; style = "curl"; }; };

          "ui.background" = { };
          "ui.background.separator" = gray5;
          "ui.cursor" = { fg = gray2; bg = violet; };
          "ui.cursor.match" = { fg = light-blue; bg = selection-blue; modifiers = ["bold"]; };
          "ui.cursor.insert" = { fg = gray2; bg = yellow; };
          "ui.cursor.select" = { fg = gray2; bg = pink; };
          "ui.cursorline.primary" = { bg = gray3; };
          "ui.selection" = { bg = gray4; };
          "ui.selection.primary" = { bg = selection-blue; };
          "ui.linenr" = gray5;
          "ui.linenr.selected" = { fg = violet; };
          "ui.statusline" = { fg = violet; bg = gray1; };
          "ui.statusline.inactive" = { fg = gray5; bg = gray1; };
          "ui.statusline.normal" = { fg = gray1; bg = violet; modifiers = ["bold"]; };
          "ui.statusline.insert" = { fg = gray1; bg = yellow; modifiers = ["bold"]; };
          "ui.statusline.select" = { fg = gray1; bg = pink; modifiers = ["bold"]; };
          "ui.bufferline" = { fg = gray5; bg = gray1; };
          "ui.bufferline.active" = { fg = light-blue; bg = gray2; modifiers = ["bold"]; };
          "ui.popup" = { fg = light-blue; bg = gray4; };
          "ui.window" = gray5;
          "ui.help" = { fg = white; bg = gray4; };
          "ui.text" = white;
          "ui.text.focus" = light-blue;
          "ui.menu" = { fg = violet; bg = gray4; };
          "ui.menu.selected" = { fg = gray2; bg = pink; modifiers = ["bold"]; };
          "ui.virtual.whitespace" = { fg = gray4; };
          "ui.virtual.indent-guide" = { fg = gray4; };
          "ui.virtual.ruler" = { bg = gray6; };
        };
      };
    };
  };
}

