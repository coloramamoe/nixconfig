{ config, pkgs, lib, tg-ws-proxy, ... }:
let
  tgPkg = tg-ws-proxy.packages.${pkgs.system}.default;
  secret = "dc4306491832082a778bc57ebbc9b464";
in
{
  environment.systemPackages = [ tgPkg ];

  systemd.services.tg-ws-proxy = {
    description = "Telegram MTProto WebSocket Proxy";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${tgPkg}/bin/tg-ws-proxy --secret ${secret}";
      DynamicUser = true;
      Restart = "always";
      RestartSec = 5;
    };
  };
}
