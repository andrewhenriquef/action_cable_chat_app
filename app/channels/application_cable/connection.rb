module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper

    identified_by :message_user

    def connect
      self.message_user = find_verified_user
    end

    def find_verified_user
      return current_user if logged_in?

      reject_unauthorized_connection
    end
  end
end
