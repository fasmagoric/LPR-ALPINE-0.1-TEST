require 'tty-spinner'
require 'io/console'
require 'etc'

system "clear"

largura_terminal = IO.console.winsize[1]

user_catch = Etc.getpwuid(Process.uid)
user = user_catch.name

maink_folder = "/lpr/@usr/krn/lprk-0.1-ALV/"
maink_load_files = Dir.entries(maink_folder)
bin_folder = "/lpr/@usr/bin/"
bin_load_files = Dir.entries(bin_folder)
yml_folder = "/lpr/@usr/yml/"
yml_load_files = Dir.entries(yml_folder)


beep_pid = spawn("speaker-test -t sine -f 1700 -l 1 -p 100 > /dev/null 2>&1")
sleep 0.26
Process.kill("TERM", beep_pid)

letter = "
 
                                                     |   _ _  _  _. _| _  _ 
                                                     |__(-|_)(_)| |(_|(_|(- 
                                                          |                 
"

puts letter.center(largura_terminal) 
puts "----------------------------------\n".center(largura_terminal)

spinner = TTY::Spinner.new("[:spinner] Inicializando kernel...", format: :dots)
spinner.auto_spin

start_time = Time.now

unless defined?($main_loaded)
  sleep(0.5)
  main_script_path = "/lpr/@usr/krn/lprk-0.1-ALV/main.rb"
  load main_script_path
  $main_loaded = true
else
  beepe_pid = spawn("speaker-test -t sine -f 500 -l 1 -p 100")
  sleep 0.26
  Process.kill("TERM", beepe_pid)
  system "clear"
  sleep(5)
  puts "Sistema ja inicializado."
end

end_time = Time.now
init_time = (end_time - start_time)

puts letter.center(largura_terminal)
puts "----------------------------------\n".center(largura_terminal)
spinner.success("(Inicializacao concluida em #{init_time.round(2)}s!)")

sleep(1)

system "clear"

puts letter.center(largura_terminal)
puts "----------------------------------\n".center(largura_terminal)

load_start = Time.now

puts "YML_LOAD:\n"
yml_load_files.each do |yfiles|
  next if yfiles == "." || yfiles == ".."
  puts "Loading #{yml_folder}#{yfiles}"
  sleep(0.01)
end

puts "\nKERNEL_LOAD:\n"
maink_load_files.each do |files|
  next if files == "." || files == ".."
  puts "Loading #{maink_folder}#{files}"
  sleep(0.1)
end

puts "\nBIN_LOAD:\n"
bin_load_files.each do |bfiles|
  next if bfiles == "." || bfiles == ".."
  puts "Loading #{bin_folder}#{bfiles}"
  sleep(0.01)
end

load_end = Time.now
load_time = (load_end - load_start)

puts ("\n(Loading concluido em #{load_time.round(2)}s!)")

sleep(1)


system "clear"

# lepory = "
#                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠶⠶⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠉⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                              ⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⢀⣤⠶⠞⠲⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                              ⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠀⠀⣠⠞⠋⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                              ⠀⠀⠀  ⠀⠀⠀⠀⣀⡤⠶⠒⠒⠛⠛⠒⠚⠁⠀⣠⠞⠁⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                              ⠀  ⠀⠀⠀⢠⡴⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⣴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⢀⡴⠞⠁⠀⠀⠀⣴⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⣾⠁⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⠘⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠙⠓⠲⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠳⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠹⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠉⠻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣄⠀⠀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠚⠉⠀⠀⠀⠀⠈⠙⠓⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⠀⢳⡄⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⠀⠀⡟⣆⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⠀⢸⠇⠘⣇⠀⠀⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⡿⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣯⣤⡀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⢿⡀⢀⡼⠃⠀⠀⠀⢀⣀⣠⡤⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠀⠀⢻⠀⠀⠀⠀⠀
#                                              ⠀⠀⠀⠀  ⠀⠀⠀⢹⡏⠀⠀⠀⠀⣴⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⢀⡟⠀⠀⠀⠀⠀
#                                              ⠀⠀  ⠀⠀⠀⠀⠀⠘⠳⠤⠤⠤⠼⣧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠞⠹⣇⡀⢀⣠⠟⠀⠀⠀⠀⠀⠀
#                                                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠙⠓⠲⠶⠤⠤⠤⠤⠶⠒⠚⠉⠁⠀⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⠀⠀
#"

#lepory.each_char do |i|
#  print (i)
#  sleep(0.0001)
#end

print letter.center(largura_terminal)
print " LEPORIDAE 0.1 (ALV) - ENTOKERNEL 1.0 - RUBY 3.3.7 - @2025".center(largura_terminal)
print "(Sistema inicializado em #{(load_time + init_time).round(2)}s!)".center(largura_terminal)

print "\n\nPress ENTER to START"
gets.chomp

beepc_pid = spawn("speaker-test -t sine -f 2000 -l 1 -p 100 > /dev/null 2>&1")
sleep 0.26
Process.kill("TERM", beepc_pid)

Dir.chdir("/lpr/")
exec "ruby '#{main_script_path}'"
