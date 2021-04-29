module Response
  # json render wrapper
  # return OK status by default
  def json_response(object, _status = :ok)
    render json: object, status: status
  end
end
