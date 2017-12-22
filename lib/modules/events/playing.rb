# frozen_string_literal: true

module Bot
  module DiscordEvents
    # Module for the Ready event
    module Playing
      extend Discordrb::EventContainer
      playing do |event|
        stream_role = nil

        event.server.roles.each do |serv_role|
          stream_role = serv_role if serv_role.name.downcase == CONFIG.stream_role.downcase
        end

        user = event.server.member(event.user.id)

        if event.type == 1
          user.add_role(stream_role)
        else
          user.remove_role(stream_role)
        end

        Discordrb::LOGGER.info event.game
      end
    end
  end
end
