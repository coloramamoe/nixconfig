{ config, pkgs, lib, ... }:
{
  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "max";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {
    cachyVars = pkgs.linuxPackages_cachyos.kernel.cachyConfig.cachyVars // {
      "_processor_opt" = "GENERIC_V4";
    };
  };

  boot.initrd.systemd.enable = true;
  boot.tmp.cleanOnBoot = true;

  boot.kernelParams = [
    "audit=0"
    "mitigations=off"
    "preempt=full"
    "nmi_watchdog=0"
    "nowatchdog"
    "nvidia.NVreg_InitializeSystemMemoryAllocations=1"
    "split_lock_detect=off"
    "intel_idle.max_cstate=1"
    "processor.max_cstate=1"
  ];

  boot.kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq_codel";
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
    "vm.swappiness" = 1;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_ratio" = 10;
    "vm.dirty_background_ratio" = 5;
    "vm.page-cluster" = 0;
    "kernel.numa_balancing" = 0;
    "kernel.sched_autogroup_enabled" = 0;
    "kernel.core_pattern" = "/dev/null";
  };
}
