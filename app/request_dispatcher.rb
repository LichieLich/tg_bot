class RequestDispatcher
  def initialize(bot)
    @bot = bot
    @commands = {
      "/start" => Commands::Start.new(@bot.api)
    }
    @fallback = Commands::Search.new(@bot.api)
  end

  def call(message)

    case message
    when Telegram::Bot::Types::Message
      dispatch_message(message)
    when Telegram::Bot::Types::CallbackQuery
      dispatch_callback(message)
    end
  end

  private

  def dispatch_message(message)
    current_user = Utils::CurrentUser.new.call(message)
    if current_user.idle?
      command = message.text
      handler = @commands.fetch(command, @fallback)
      handler.call(message)
    else
      dispatch_searching(current_user, message)
    end
  end

  def dispatch_searching(current_user, message)
    # if current_user.new_search?
    #   Commands::Search.new(@bot.api).call(message)
    # elsif current_user.new_translation?
      #      Commands::AddTranslation.new(@bot.api).call(message)
    # end
    current_user.finish!
  end
end
