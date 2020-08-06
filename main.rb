require 'telegram/bot'

TOKEN = '1325239525:AAHOEG-cmA8n9M0PYnIEmZfALDf4vOKeIjg'.freeze
ANSWERS = [
  # Положительные
  'Бесспорно',
  'Предрешено',
  'Никаких сомнений',
  'Определенно да',
  'Мрожешь быть уверен в этом',
  # Нерешительно положителлььные
  'Мне кажется = "Да"',
  'Вероятнее всего',
  'Хорошие перспективы',
  'Знаки говорят - "Да"',
  'Да',
  # Нейтральные
  'Пока не ясно, попробуй снова',
  'Спроси похже',
  'Лучше не рассказывать',
  'Сейчас нельзя предсказать',
  'Сконцентрируйся и спроси опять',
  # Отрицательные
  'Даже не думай',
  'Мой ответ - "Нет"',
  'По моим данным - "Нет"',
  'Перспективы не очень хорошие',
  'Весьма сомнительно'
].freeze

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Здравствуй, #{message.from.first_name}"
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWERS.sample
      )
    end
  end
end
