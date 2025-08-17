{ config, lib, inputs, pkgs, ... }: {
  
  ## config fish
   #environment.systemPackages = with pkgs; [
    #fishPlugins.done
    #fishPlugins.fzf-fish
    #fishPlugins.forgit
    #fishPlugins.hydro
    #fzf
    #fishPlugins.grc
    #grc
  #];

  # programs.fish.enable = true;

  ## auto start fish com bash
  #programs.bash = {
  #interactiveShellInit = 
  #'' if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
  #  then
  #    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
  #    exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
  #  fi '';
}
