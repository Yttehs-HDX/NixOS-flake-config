{ lib }:

enabled: body:
{
  config = lib.mkIf enabled body;
}
