require 'active_support/core_ext/object/inclusion'

Trash.define "starter" do
  #@alolan = @config.alolan
  puts "On essaie d'attraper un starter"

  lower_motors

  loop do
    normal_mode do
      #début de la séquence devant la forêt
      press(:up, 2000)
      #All right! To the lake!
      press(:a, 4000)
      #What's going on?
      press(:a, 2000)
      #Professor, there isn't
      press(:a, 1000)
      #Humm I may have been
      press(:a, 1000)
      #Something appears to be
      press(:a, 1000)
      #Fine! It's enough
      press(:a, 1000)
      #Dawn, we'Re leaving
      press(:a, 2000)
      #Professor, how are you
      press(:a, 1000)
      #It must be
      press(:a, 1000)
      #Hum.. there is one
      press(:a, 1000)
      #There are
      press(:a, 1000)
      #our studies.
      press(:a, 4000)
      #Excuse me
      press(:a, 2000)
      #I beg you pardon
      press(:a, 3500)
      #What was that anout
      press(:a, 2500)
      #Huh? Laurent!
      press(:a, 1000)
      #...
      press(:a, 1000)
      #What's that?
      press(:a, 1000)
      #No problem
      press(:a, 4500)
      #It's... a briefcase
      press(:a, 1000)
      #What are we supposed
      press(:a, 1000)
      #I heard them say
      press(:a, 2000)
      #Waaaah! P-Pokémon
      press(:a, 1000)
      #What's going on?!
      press(:a, 3500)
      #Look! These are Poké Balls
      press(:a, 1000)
      #Which one do you want

      #Choix!
      press(:right, 200)
      press(:right, 200)
      press(:a, 1500)
 

      #will you choose the Tiny Lead Pokémon 
      #(cursor move)
      press(:up, 1700)

      #PHOTO

      #If shiny, stop else:


      range_min = 207
      range_max = 220

      #fire('shiny') if shiny?(range_min..range_max)

      light(:not_shiny, true)
      sleep 2
      light(:not_shiny, false)
    end

    reseting do
      press(:home, 200)
      press(:x, 200)
      press(:a, 200)
      press(:a, 2200)
      press(:a, 200)
      press(:a, 600)
    end
  end
end
