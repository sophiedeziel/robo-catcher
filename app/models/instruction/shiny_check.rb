class Instruction
  class ShinyCheck < Instruction
    def self.human_name
      "Vérification de Shiny"
    end

    def human_name
      self.class.human_name
    end

    def send_message?
      true
    end

    def execute(robot)
      super do
        pokemon = Pokemon.find(sequence.current_pokemon_id)

        hue = robot.get_pixel_color
        image = robot.send_image

        attempt = create_attempt(pokemon, hue, image)

        if attempt.shiny?
          Rails.logger.info "ON A UN SHINY!!!!!!!"
          robot.light :shiny, true
          
          robot.send_message(attempt) if send_message?
          
          robot.stop
        else
          Rails.logger.info("NOT SHINY")
        end
      end
    end

    private

    def shiny?(pokemon, hue)
      range = (pokemon.hue - pokemon.tolerance)..(pokemon.hue + pokemon.tolerance)
      Rails.logger.info( "Hue: #{hue}" )
      Rails.logger.info( "Checking range: #{range}" )
      !hue.in? range
    end

    def create_attempt(pokemon, hue, image)
      Attempt.create(
        pokemon: pokemon.name,
        image: image,
        detected_hue: hue,
        hue_min: pokemon.hue - pokemon.tolerance,
        hue_max: pokemon.hue + pokemon.tolerance,
        is_shiny: shiny?(pokemon, hue)
      )
    end
  end
end