class Notification < ApplicationRecord
  def self.notify(status_code = 200, message = 'success', data = {})
    {
        status_code: status_code,
        message: message,
        data: data
    }
  end
end
