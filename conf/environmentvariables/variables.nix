{ config, lib, inputs, pkgs, ... }: {

  environment.variables = {
    __GL_SHADER_DISK_CACHE_SIZE = "12000000000";
    GITHUB_TOKEN = "colocar depois" # Recomendado manter tokens em segredo
    VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
  };
}
