print "Appuyer sur une Entrer pour commencer..."
gets

begin
    system("ocra --output matrice.exe ../main.rb")    
rescue => exception
    puts "Impossible de compiler le script"
    puts exception.message
end

puts "\nTerminer..."
gets