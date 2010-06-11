class YouroomController < ApplicationController
  before_filter :setup_user, :only=>[:list_html, :entries]

  def index
  end

  def show
    @room_id = params[:id]
  end

  def list_html
    render :json => client.get_my_group.body
  end

  def entries
    render :json => client.get_entry(params[:id]).body
  end

  private
  def setup_user
    @user = User.find_by_bpr(request.headers["HTTP_IS_USER"])
  end

  def client
    @client ||= Youroom::Request.new(access_token)
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
