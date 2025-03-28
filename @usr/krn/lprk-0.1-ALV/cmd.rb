# + ================================================= +
# | FILE: sys/krn/cmd.rb                              |
# + ================================================= +

require_relative 'recall'

class CMD 
  def self.touch
    if $command_key == 'touch'
      KFN.recall('file_operations', 'create_file', { filename: $command_arg } )
      puts "#{$green}#{$command_arg} [new file]-> #{$relative_dir}/#{$command_arg}#{$reset}"
      return
    end
  end
  def self.ls
    if $command_key == 'ls' || $command_key == 'l'
      KFN.recall('file_operations', 'list_files', { directory: $command_arg } )
      return
    end
  end
  def self.cd
    if $command_key == 'cd' || $command_key == 'd'
      KFN.recall('file_operations', 'walk_in', { path: $command_arg } )
      return
    end
  end
  def self.vim
    if $command_key == 'vim'
      KFN.recall('text_editor', 'vim', { file: $command_arg } )
      return
    end
  end
  def self.cat
    if $command_key == 'cat' || $command_key == 'meow'
      print "\n"
      KFN.recall('file_operations', 'meow_files', { file: $command_arg } )
      return
    end
  end
  def self.clear
    if $command_key == 'clear' || $command_key == 'c'
      KFN.recall('terminal', 'clear', { nothin: $command_arg } )
      return
    end
  end
  def self.ping
    if $command_key == 'ping'
      KFN.recall('network_commands', 'ping', { host: $command_arg })
    end
  end
end

CMD.new
