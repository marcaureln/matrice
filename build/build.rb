print "Appuyer sur une touche pour commencer..."
gets

begin
    exec("ocra main.rb")    
rescue => exception
    puts "Impossible de compiler le script"
    puts exception.message
end

puts "\nTerminer..."
gets