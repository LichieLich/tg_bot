require_relative "./base"
require_relative "../band_finder/band_finder"

module Commands
  class Search < Base
    TEXT = "Нашёл вот эти группы:".freeze

    private

    def handle_call(message)
      current_user.requests.create!(value: message.text)
      current_user.new_search! 
      band_info = BandFinder.new(message.text).build_response
      send_message(
        chat_id: message.chat.id,
        text: "#{TEXT}\n #{band_info}",
        parse_mode: :markdown
      )
      current_user.finish!
    end
  end
end
