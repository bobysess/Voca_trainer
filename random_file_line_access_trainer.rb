#class RandomFileLineAccessTrainer


#end

require 'green_shoes'

NUMBER_OF_CORRECTNESS = 4
# check if  the training is finished
def is_training_finished(points)
  res = true
  points.each do | point|
    if point <=  NUMBER_OF_CORRECTNESS
      res= false
      return false
    end
  end

  return true
end

# get the next word index
def  get_next_word_index (points)
  random = Random.new
  rand = random.rand(points.length)
  while ( points[rand] > NUMBER_OF_CORRECTNESS)
    rand = random.rand(points.length)
  end
  return rand

end


filename = ask_open_file
puts "filename  : #{filename}";
lines = File.readlines(filename)
points = []
#init points
lines.each do |line|
   points.push(0);
end

input ="";
index_next=0;

while ( (input = gets).strip != "q" and !is_training_finished(points)) do
   #puts "points --> #{points.to_s}"
  #set points
   if (input.strip == "")
      points[index_next] += 1
   elsif(input.strip == "p") # show the current points
      puts points.to_s
   else
      points[index_next] -= 1
   end



   # set next word
   index_next = get_next_word_index(points);
   word = lines[index_next];
   puts "\n"
   puts word;

   #points[index_next] += 1
end



puts "Training  Finished"

#button_yes was pressed, this means the user know the response
#Button_no  was prressed, this means the use dont know the response
#set the new Word in the windows
# change the  number of Corretness
