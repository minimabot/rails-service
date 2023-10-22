class V1::UsersController < ApiController
  def index
    render json: { username: 'dev' }
  end
end
