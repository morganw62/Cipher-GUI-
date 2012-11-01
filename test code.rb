Shoes.app :width => 300, :height => 100 do


  def encode(input='split test', to_code=true, seed=0)
  #input='split test'
  #seed = 0
  source = 3.1415926535897932384626433
  #to_code=true, false, or 13
  decode= ''
  ascii=[]

  #This picks whether you're doing or undoing code
  case to_code
  when false
      to_code_coefficient= -1
  when true
      to_code_coefficient = 1
  else
      to_code_coefficient=1
  end

  #Breaks the input string into pieces and converts to ascii
  splitcode=input.split(%r{\s*})

  input.each_byte do |c|
       ascii << c
  end


  #Actually converts to encoded ascii and then to text
  if to_code != 13
    splitsource =source.to_s.split(%r{\s*}) - ['.']
    for i in 0..ascii.length-1
      ascii[i] += to_code_coefficient * splitsource[i+seed].to_i
      decode << ascii[i].chr
    end
    #  if ascii[i]>126
     #     ascii[i] += -(126-31)
      #end
  # Ascii greater than 126 or less than 31 aren't characters


   #   if ( ascii[i] >=  65 and ascii[i] <= 65+25 ) or ( ascii[i] >=  97 and ascii[i] <= 97+25 )



    #  else
    #      puts 'fail'
   #   end

  #13 shift
  else
    for i in 0..ascii.length-1       
      if ascii[i]>=65 and ascii[i] <=90
        ascii[i]+=13
        if ascii[i]>90
          ascii[i] += -26
        end
      elsif ascii[i]>=97 and ascii[i]<=122
        ascii[i] +=13
        if ascii[i]>122
          ascii[i] += -26
        end
      end
      decode << ascii[i].chr
    end
  end
  decode
end


  flow do
    @e = edit_line
    button "Go!" do
      @abc.text = encode(@e.text,13)
      @e.text = ''
    end
    @abc = edit_line
    
  end
end