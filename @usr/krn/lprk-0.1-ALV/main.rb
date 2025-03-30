# + ================================================= +
# | FILE: sys/krn/main.rb                             |
# + ================================================= +

require 'yaml'
require 'etc'
require_relative 'recall'
require_relative 'cmd'

# colors
$red = "\033[31m"
$green = "\033[32m"
$yellow = "\033[33m"
$cyan = "\033[36m"
$reset = "\033[0m"

def error_beep
  beep_error_pid = spawn("speaker-test -t sine -f 500 > /dev/null 2>&1")
  sleep 0.26
  Process.kill("TERM", beep_error_pid)
end

def exit_beep
  beep1_pid = spawn("speaker-test -t sine -f 1000 > /dev/null 2>&1")
  sleep 0.12
  Process.kill("TERM", beep1_pid)
  beep2_pid = spawn("speaker-test -t sine -f 1100 > /dev/null 2>&1")
  sleep 0.12
  Process.kill("TERM", beep2_pid)
  beep3_pid = spawn("speaker-test -t sine -f 1200 > /dev/null 2>&1")
  sleep 0.12
  Process.kill("TERM", beep3_pid)
  beep4_pid = spawn("speaker-test -t sine -f 1300 > /dev/null 2>&1")
  sleep 0.12
  Process.kill("TERM", beep4_pid)
  beep5_pid = spawn("speaker-test -t sine -f 1500 > /dev/null 2>&1")
  sleep 0.23
  Process.kill("TERM", beep5_pid)
  beep6_pid = spawn("speaker-test -t sine -f 1400 > /dev/null 2>&1")
  sleep 0.23
  Process.kill("TERM", beep6_pid)
end

user_catch = Etc.getpwuid(Process.uid)
user = user_catch.name
config = '/lpr/@usr/yml/config.yaml'

begin
  yml = YAML.load_file(config)
rescue Errno::ENOENT
  error_beep
  puts "#{$red}[!] - ERRO: O arquivo '#{config}' nao foi encontrado.#{$reset}"
  exit(1)
rescue Psych::SyntaxError => e 
  error_beep
  puts "#{$red}[!] - ERRO: Erro de sintaxe no arquivo de configuracao YAML: #{e.message}#{$reset}"
end

system "clear"

if $PROGRAM_NAME == __FILE__
  loop do
    $dir = Dir.pwd

    hostname = `hostname`.chomp

    print "#{$red} /^ #{$reset}# #{user}@#{hostname} # #{$dir} $ "
    command = gets.chomp

    break if command == 'exit' && exit_beep && system("clear")

    parts = command.split(' ', 2)
    $command_key = parts[0]
    $command_arg = parts[1]
    puts " [_ CMD-KEY: #{$command_key} | CMD-ARG: #{$command_arg} " 

    if defined?(CMD)
      case $command_key
      when 'vim' then CMD.vim 
      when 'clear', 'c' then CMD.clear
      when 'touch' then CMD.touch
      when 'ls', 'l' then CMD.ls
      when 'cd', 'd' then CMD.cd
      when 'cat', 'meow' then CMD.cat
      when 'ping' then CMD.ping
      when 'rm' then CMD.rm
      else 
        error_beep
        puts "#{$red}[!] - ERRO: Comando '#{$command_key}' nao reconhecido.#{$reset}"
      end
    else
      error_beep     
      puts "#{red}[!] - ERRO: CMD nao foi inicializado corretamente!#{reset}"
      exit(1)
    end
    puts "\n" if $command_key != "clear" && $command_key != "c"
  end
end
