require_relative "./base"

module Commands
  class Start < Base
    TEXT = "Поиск групп из ресурса Metal Archives\n /start - show info".freeze

    private

    def handle_call(message)
      send_message(
        chat_id: message.chat.id,
        text: TEXT,
        parse_mode: :markdown,
        reply_markup: ::Keyboards::StartKeyboards.new.call
      )
    end
  end
end
