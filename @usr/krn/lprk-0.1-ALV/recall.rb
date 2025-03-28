# + ================================================= +
# | FILE: sys/krn/recall.rb                           |
# + ================================================= +

require 'yaml'
require 'pathname'
require 'etc'

class KFN
  $user_catch = Etc.getpwuid(Process.uid)
  $user = $user_catch.name
  RESTRICTED_PATH = "/lpr"
  def self.recall(category, command_name, user_arguments)
    yml_file = "/lpr/@usr/yml/config.yaml"
    yml_config = YAML.load_file(yml_file) 

    unless yml_config[category] && yml_config[category][command_name]
      error_beep
      puts "Comando '#{command_name}' na categoria '#{category}' nao encontrado."
      return
    end

    command_config = yml_config[category][command_name]
    base_command = command_config['command']
    arguments_config = command_config['arguments'] || []
    command_to_execute = base_command

    arguments_config.each do |arg_config|
      arg_name = arg_config['name']
      required = arg_config['required']
      flag = arg_config['flag']
      user_value = user_arguments[arg_name.to_sym]

      if required && user_value.nil?
        error_beep
        puts "O argumento '#{arg_name}' eh obrigatorio para o comando '#{command_name}'."
        return
      elsif !user_value.nil?
        command_to_execute << " #{flag}" if flag
        command_to_execute << " #{user_value}"
      end
    end

    if command_name == 'walk_in'
      if user_arguments[:path]
        target_path = Pathname.new(Dir.pwd).join(user_arguments[:path]).cleanpath
        restricted_path = Pathname.new(RESTRICTED_PATH).cleanpath
        if target_path.to_s.start_with?(restricted_path.to_s) || target_path.to_s == restricted_path.to_s
          begin
            Dir.chdir(user_arguments[:path])
          rescue Errno::ENOENT
            error_beep
            puts "#{$red}[!] - ERRO: O diretorio '#{user_arguments[:path]}' nao foi encontrado.#{$reset}"
          rescue Errno::EACCES
            error_beep
            puts "#{$red}[!] - ERRO: Permissao negada para acessar '#{user_arguments[:path]}'.#{$reset}"
          rescue StandardError => e
            error_beep
            puts "#{$red}[!] - ERRO ao mudar para o diretorio '#{user_arguments[:path]}': #{e.message}#{$reset}"
          end
        else 
          error_beep
          puts "#{$red}[!] - ERRO: Voce nao tem permissao para acessar diretorios fora de '#{RESTRICTED_PATH}'.#{$reset}"
        end
      else
        error_beep
        puts "#{$red}[!] - ERRO: Caminho nao especificado para o comando 'cd'.#{$reset}"
      end
    else
      system(command_to_execute)
    end
  end
end

KFN.new
