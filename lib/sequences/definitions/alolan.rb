Trash.define "alolan" do
  loop do
    @alolan.number.times do
      @alolan.run_tries += 1
      @alolan.total_tries += 1
      @alolan.save

      normal_mode do
        press(:a, @alolan.delay_1)
        press(:a, @alolan.delay_2)
        press(:a, @alolan.delay_3) if @alolan.pokemon.in? ['Grimer', 'Sandshrew', 'Raichu', 'Vulpix', 'Exeggutor', 'Marowak', 'Meowth']
        press(:a, @alolan.delay_4)
        press(:a, @alolan.delay_5)
        press(:a, @alolan.delay_6)
        press(:a, @alolan.delay_7)
        press(:a, @alolan.delay_8)

        Rake::Task['robo_catcher:shiny'].execute if alolan_shiny?

        @arduino.digital_write led[:not_shiny], true
        sleep @alolan.delay_9 / 1000.0
        press(:a, @alolan.delay_10)
        press(:a, @alolan.delay_11)
        press(:a, @alolan.delay_12) if @alolan.pokemon.in? ['Sandshrew', 'Raichu', 'Vulpix', 'Diglett', 'Geodude', 'Exeggutor', 'Marowak']
        @arduino.digital_write led[:not_shiny], false
      end
    end

    reset
  end
end
