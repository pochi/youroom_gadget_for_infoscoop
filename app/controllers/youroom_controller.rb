require "json"

class YouroomController < ApplicationController
  YOUROOM_URL = 'https://www.youroom.in/'
  before_filter :setup_user, :only=>[:list_html, :entries]

  def index
  end

  def show
    @room_id = params[:id]
  end

  def list_html
    render :json => client.get_my_group.to_json
  end

  def entries
    json = params[:mutter_id] ? client.get_entry(params[:id], params[:mutter_id]).to_json : client.get_entry(params[:id]).to_json
    logger.info json.inspect
    render :json => json
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
                                        :site=>YOUROOM_URL)
  end

  def access_token
    @access_token ||= ::OAuth::AccessToken.new(consumer,
                                               @user.youroom_oauth.access_token,
                                               @user.youroom_oauth.access_token_secret)
  end

end
