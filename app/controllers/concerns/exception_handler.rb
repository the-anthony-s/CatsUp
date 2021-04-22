module ExceptionHandler
  # provides the more graceful `included` method
  # https://api.rubyonrails.org/classes/ActiveSupport/Concern.html
  extend ActiveSupport::Concern

  included do
    # return RecordNotFound if no record
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    # return RecordInvalide if wrong params
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    # return RecordNotUnique if constraint problem
    rescue_from ActiveRecord::RecordNotUnique do |e|
      json_response({ message: "Unique contraint error (Error message: #{e.message})" }, :conflic)
    end
  end
end