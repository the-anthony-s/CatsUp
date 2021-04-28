module ExceptionHandler
  # provides the more graceful `included` method
  # https://api.rubyonrails.org/classes/ActiveSupport/Concern.html
  extend ActiveSupport::Concern

  included do
    # return RecordNotFound if no record -> 404
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    # return RecordInvalide if wrong params -> 422
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    # return RecordNotUnique if constraint problem -> 409
    rescue_from ActiveRecord::RecordNotUnique do |e|
      json_response({ message: "unique constraint error (Error message: #{e.message})" }, :conflict)
    end
  end
end
