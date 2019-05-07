require 'active_support/core_ext/object/inclusion'

Trash.define "alolan" do
  @alolan = @config.alolan
  puts "On essaie d'attraper un #{@alolan[:pokemon]}"

  lower_motors

  loop do
    @alolan[:number].times do

      normal_mode do
        press(:a, @alolan[:delay_1])
        press(:a, @alolan[:delay_2])
        press(:a, @alolan[:delay_3]) if @alolan[:pokemon].in? ['Grimer', 'Sandshrew', 'Raichu', 'Vulpix', 'Exeggutor', 'Marowak', 'Meowth']
        press(:a, @alolan[:delay_4])
        press(:a, @alolan[:delay_5])
        press(:a, @alolan[:delay_6])
        press(:a, @alolan[:delay_7])
        press(:a, @alolan[:delay_8])

        range_min = @alolan[(@alolan[:pokemon].downcase + '_range_min').to_sym]
        range_max = @alolan[(@alolan[:pokemon].downcase + '_range_max').to_sym]

        fire('shiny') if shiny?(range_min..range_max)

        light(:not_shiny, true)
        sleep @alolan[:delay_9] / 1000.0
        press(:a, @alolan[:delay_10])
        press(:a, @alolan[:delay_11])
        press(:a, @alolan[:delay_12]) if @alolan[:pokemon].in? ['Sandshrew', 'Raichu', 'Vulpix', 'Diglett', 'Geodude', 'Exeggutor', 'Marowak']
        light(:not_shiny, false)
      end
    end

    fire('reset')
  end
end

