# frozen_string_literal: true

module Bot
  module DiscordEvents
    # Module for the Ready event
    module MemberJoin
      extend Discordrb::EventContainer
      member_join do |event|
        role = nil

        event.server.roles.each do |serv_role|
          role = serv_role if serv_role.name.downcase == CONFIG.friend_role.downcase
        end

        event.user.add_role(role) if role
      end
    end
  end
end
