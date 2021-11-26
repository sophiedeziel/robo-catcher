require 'active_support/core_ext/object/inclusion'

Trash.define "starter" do
  @starter = Starter.instance

  @starter.run_tries = 0
  @starter.save

  puts "On essaie d'attraper un Piplup"

  lower_motors

  loop do
    normal_mode do
      light(:not_shiny, false)
      # Début de la séquence devant la forêt

      press(:up, @starter.delay_1)
      # All right! To the lake!
      press(:a, @starter.delay_2)
      # What's going on?
      press(:a, @starter.delay_3)
      # Professor, there isn't
      press(:a, @starter.delay_4)
      # Humm I may have been
      press(:a, @starter.delay_5)
      # Something appears to be
      press(:a, @starter.delay_6)
      # Fine! It's enough
      press(:a, @starter.delay_7)
      # Dawn, we're leaving
      press(:a, @starter.delay_8)
      # Professor, how are you
      press(:a, @starter.delay_9)
      # It must be
      press(:a, @starter.delay_10)
      # Hum.. there is one
      press(:a, @starter.delay_11)
      # There are
      press(:a, @starter.delay_12)
      # our studies.
      press(:a, @starter.delay_13)
      # Excuse me
      press(:a, @starter.delay_14)
      # I beg you pardon
      press(:a, @starter.delay_15)
      # What was that anout
      press(:a, @starter.delay_16)
      # Huh? Laurent!
      press(:a, @starter.delay_17)
      # ...
      press(:a, @starter.delay_18)
      # What's that?
      press(:a, @starter.delay_19)
      # No problem
      press(:a, @starter.delay_20)
      # It's... a briefcase
      press(:a, @starter.delay_21)
      # What are we supposed
      press(:a, @starter.delay_22)
      # I heard them say
      press(:a, @starter.delay_23)
      # Waaaah! P-Pokémon
      press(:a, @starter.delay_24)
      # What's going on?!
      press(:a, @starter.delay_25)
      # Look! These are Poké Balls
      press(:a, @starter.delay_26)
      # Which one do you want

      #Choix!
      press(:right, @starter.delay_27)
      press(:right, @starter.delay_28)
      press(:a, @starter.delay_29)

      press(:up, @starter.delay_30)
      press(:a, @starter.delay_31)
 
      range_min = @starter.piplup_range_min
      range_max = @starter.piplup_range_max

      @starter.run_tries += 1
      @starter.total_tries += 1
      @starter.piplup_total += 1 if @starter.pokemon == 'Piplup'
      @starter.save

      if shiny?(range_min..range_max)
        Rails.logger.info "ON A UN SHINY!!!!!!!"
        light :shiny, true
        raise_motors
        exit
      end

      light(:not_shiny, true)
    end

    reseting do
      press(:home, 1000)
      press(:x, 1000)
      press(:a, 1000)
      press(:a, 1000)
      press(:a, 28000)
      press(:a, 3000)
      press(:a, 15000)
    end
  end
end

Trash.define "starter_reset" do
  reseting do
    press(:home, 1000)
    press(:x, 1000)
    press(:a, 1000)
    press(:a, 1000)
    press(:a, 28000)
    press(:a, 3000)
    press(:a, 15000)
  end
end