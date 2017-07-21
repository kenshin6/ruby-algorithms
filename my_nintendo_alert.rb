#Checks to see if the Switch is in stock on nintendo's Japanese store.
#Unfortunately, I don't know what the page looks like when it's in stock,
#so this simply sends a notification to your mac when SOLD OUT dissapears.
#Feel free to use!

require 'net/http'

#Uses the terminal-notifer gem
require 'terminal-notifier'

def notify_me
  TerminalNotifier.notify('Gogogo!', open: 'https://store.nintendo.co.jp/customize.html')
end

total = 0
600.times do
  begin
    sleep 60
    uri = URI('https://store.nintendo.co.jp/customize.html')
    File.write('store.html', Net::HTTP.get(uri))
    total += 1
    unless File.readlines('store.html').grep(/SOLD OUT/).any?
      notify_me
      break
    end
    puts "Done checking ##{total}"
  rescue SocketError
    notify_me
  end
end

puts "Finished for today"
