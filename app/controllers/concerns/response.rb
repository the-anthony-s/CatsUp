module Response
  # json render wrapper
  # return OK status by default
  def json_response(model, _status = :ok)
    # render json: model, status: status
    render json: model, status: :ok
  end
end
