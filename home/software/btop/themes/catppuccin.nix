{ config, lib, ... }:

let
  theme = config.desktop.style.theme or { };
  themeName = theme.name or "";
  palette = theme.palette or { };
in {
  config = lib.mkIf (themeName == "catppuccin") {
    xdg.configFile."btop/themes/catppuccin-mocha.theme".text = ''
      # Main background, empty for terminal default, need to be empty if you want transparent background
      theme[main_bg]="${palette.base}"

      # Main text color
      theme[main_fg]="${palette.text}"

      # Title color for boxes
      theme[title]="${palette.text}"

      # Highlight color for keyboard shortcuts
      theme[hi_fg]="${palette.blue}"

      # Background color of selected item in processes box
      theme[selected_bg]="${palette.surface1}"

      # Foreground color of selected item in processes box
      theme[selected_fg]="${palette.blue}"

      # Color of inactive/disabled text
      theme[inactive_fg]="${palette.overlay1}"

      # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
      theme[graph_text]="${palette.rosewater}"

      # Background color of the percentage meters
      theme[meter_bg]="${palette.surface1}"

      # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
      theme[proc_misc]="${palette.rosewater}"

      # CPU, Memory, Network, Proc box outline colors
      theme[cpu_box]="${palette.mauve}" #Mauve
      theme[mem_box]="${palette.green}" #Green
      theme[net_box]="${palette.maroon}" #Maroon
      theme[proc_box]="${palette.blue}" #Blue

      # Box divider line and small boxes line color
      theme[div_line]="${palette.overlay0}"

      # Temperature graph color (Green -> Yellow -> Red)
      theme[temp_start]="${palette.green}"
      theme[temp_mid]="${palette.yellow}"
      theme[temp_end]="${palette.red}"

      # CPU graph colors (Teal -> Lavender)
      theme[cpu_start]="${palette.teal}"
      theme[cpu_mid]="${palette.sapphire}"
      theme[cpu_end]="${palette.lavender}"

      # Mem/Disk free meter (Mauve -> Lavender -> Blue)
      theme[free_start]="${palette.mauve}"
      theme[free_mid]="${palette.lavender}"
      theme[free_end]="${palette.blue}"

      # Mem/Disk cached meter (Sapphire -> Lavender)
      theme[cached_start]="${palette.sapphire}"
      theme[cached_mid]="${palette.blue}"
      theme[cached_end]="${palette.lavender}"

      # Mem/Disk available meter (Peach -> Red)
      theme[available_start]="${palette.peach}"
      theme[available_mid]="${palette.maroon}"
      theme[available_end]="${palette.red}"

      # Mem/Disk used meter (Green -> Sky)
      theme[used_start]="${palette.green}"
      theme[used_mid]="${palette.teal}"
      theme[used_end]="${palette.sky}"

      # Download graph colors (Peach -> Red)
      theme[download_start]="${palette.peach}"
      theme[download_mid]="${palette.maroon}"
      theme[download_end]="${palette.red}"

      # Upload graph colors (Green -> Sky)
      theme[upload_start]="${palette.green}"
      theme[upload_mid]="${palette.teal}"
      theme[upload_end]="${palette.sky}"

      # Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
      theme[process_start]="${palette.sapphire}"
      theme[process_mid]="${palette.sky}"
      theme[process_end]="${palette.mauve}"
    '';
  };
}
