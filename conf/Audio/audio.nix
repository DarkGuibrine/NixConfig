{ config, lib, inputs, pkgs, ... }: {

  ## Configuração de áudio com Pipewire (desativa PulseAudio)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # Descomente se usar aplicações JACK
  };

}
