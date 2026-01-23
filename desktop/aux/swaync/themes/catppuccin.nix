{ config, lib, ... }:

let
  lookup = import ../../../../_lib/getStyle.nix { };
  theme = lookup.getTheme config;
  themeName = theme.name or "";
  fonts = (lookup.getStyle config).fonts or { };
  palette = theme.palette or { };
  fontDefault = fonts.default or "DejaVu Sans";
in {
  config = lib.mkIf (themeName == "catppuccin") {
    services.swaync.style = ''
      * {
        all: unset;
        font-size: 14px;
        font-family: "${fontDefault}";
        transition: 200ms;
      }

      trough highlight {
        background: ${palette.text};
      }

      scale trough {
        margin: 0rem 1rem;
        background-color: ${palette.surface0};
        min-height: 8px;
        min-width: 70px;
      }

      slider {
        background-color: ${palette.blue};
      }

      .floating-notifications.background .notification-row .notification-background {
        box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px ${palette.surface0};
        border-radius: 12.6px;
        margin: 18px;
        background-color: ${palette.base};
        color: ${palette.text};
        padding: 0;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 7px;
        border-radius: 12.6px;
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        box-shadow: inset 0 0 7px 0 ${palette.red};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        color: ${palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
        color: ${palette.subtext0};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        color: ${palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border-radius: 7px;
        color: ${palette.text};
        background-color: ${palette.surface0};
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        background-color: ${palette.surface0};
        color: ${palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        background-color: ${palette.sapphire};
        color: ${palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        border-radius: 6.3px;
        color: ${palette.base};
        background-color: ${palette.red};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        background-color: ${palette.maroon};
        color: ${palette.base};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: ${palette.red};
        color: ${palette.base};
      }

      .control-center {
        box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px ${palette.surface0};
        border-radius: 12.6px;
        margin: 18px;
        background-color: ${palette.base};
        color: ${palette.text};
        padding: 14px;
      }

      .widget-title {
        margin-bottom: 5px;
      }

      .control-center .widget-title > label {
        color: ${palette.text};
        font-size: 1.3em;
      }

      .control-center .widget-title button {
        border-radius: 7px;
        color: ${palette.text};
        background-color: ${palette.surface0};
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        padding: 8px;
      }

      .control-center .widget-title button:hover {
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        background-color: ${palette.surface2};
        color: ${palette.text};
      }

      .control-center .widget-title button:active {
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        background-color: ${palette.sapphire};
        color: ${palette.base};
      }

      .control-center .notification-row .notification-background {
        border-radius: 7px;
        color: ${palette.text};
        background-color: ${palette.surface0};
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        margin-top: 14px;
      }

      .control-center .notification-row .notification-background .notification {
        padding: 7px;
        border-radius: 7px;
      }

      .control-center .notification-row .notification-background .notification.critical {
        box-shadow: inset 0 0 7px 0 ${palette.red};
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: ${palette.subtext0};
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border-radius: 7px;
        color: ${palette.text};
        background-color: ${palette.crust};
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        background-color: ${palette.surface0};
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        box-shadow: inset 0 0 0 1px ${palette.surface1};
        background-color: ${palette.sapphire};
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        border-radius: 6.3px;
        background-color: ${palette.red};
        color: ${palette.base};
      }

      .control-center .notification-row .notification-background .close-button:hover {
        background-color: ${palette.maroon};
        color: ${palette.base};
      }

      .control-center .notification-row .notification-background .close-button:active {
        background-color: ${palette.red};
        color: ${palette.base};
      }

      .control-center .notification-row .notification-background .notification.low {
        opacity: 0.6;
      }

      .control-center .notification-row .notification-background .notification.critical {
        box-shadow: inset 0 0 7px 0 ${palette.red};
      }

      .control-center .notification-row .notification-background .notification:hover {
        background-color: ${palette.surface1};
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification:active {
        background-color: ${palette.surface1};
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        background-color: ${palette.surface1};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        background-color: ${palette.sapphire};
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: ${palette.subtext0};
      }

      .control-center .notification-row .notification-background .notification .notification-content .app-icon {
        border-radius: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .app-icon-image {
        border-radius: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .app-icon-image > image {
        border-radius: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        font-weight: 700;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title {
        font-weight: 700;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        font-weight: 400;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body {
        font-weight: 400;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text {
        font-weight: 400;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line {
        font-weight: 400;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title,
      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title:focus,
      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line:focus {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title > .summary_text,
      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line > .body_text {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title > .summary_text:focus,
      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line > .body_text:focus {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title > .summary_text > .summary_text,
      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line > .body_text > .body_text {
        color: ${palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary > .notification-title > .summary_text > .summary_text:focus,
      .control-center .notification-row .notification-background .notification .notification-content .body > .notification-body > .notification-body-text > .notification-body-line > .body_text > .body_text:focus {
        color: ${palette.text};
      }
    '';
  };
}
