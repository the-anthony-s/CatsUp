module Response
  # json render wrapper
  # return OK status by default
  def json_response(model, _status = :ok)
    render json: model, status: status
  end
end
