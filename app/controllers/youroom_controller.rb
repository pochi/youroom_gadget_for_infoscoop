class YouroomController < ApplicationController
  before_filter :setup_user, :only=>[:show, :list_html]

  def index
  end

  def show
    logger.info params.inspect
  end

  def list_html
    client = Youroom::Request.new(access_token)
    logger.info client.get_my_group.body
    render :json => client.get_my_group.body
  end

  private
  def setup_user
    @user = User.find_by_bpr(request.headers["HTTP_IS_USER"])
  end

  def consumer
    @consumer ||= ::OAuth::Consumer.new(@user.youroom_oauth.consumer_key,
                                        @user.youroom_oauth.consumer_secret,
                                        :site=>"https://api.youroom.in/")
  end

  def access_token
    @access_token ||= ::OAuth::AccessToken.new(consumer,
                                               @user.youroom_oauth.access_token,
                                               @user.youroom_oauth.access_token_secret)
  end

end
