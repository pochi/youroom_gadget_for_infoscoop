class YouroomController < ApplicationController
  def index
  end

  def list_html
    user_id = request.headers["HTTP_IS_USER"]

    consumer = OAuth::Consumer.new("up3xopytN53tYzIiy4v7",
                                   "oii4Nl9qEOhumFji6Uq6In5VU4VbhK697hV078kJ",
                                   :site => "https://api.youroom.in/")

    info = consumer.get_access_token(nil, { },
                                     {:x_auth_mode=>"client_auth",
                                       :x_auth_username=>"pochi.black@gmail.com",
                                       :x_auth_password=>"eyefunny"})

    access_token = OAuth::AccessToken.new(consumer,
                                          info.params['oauth_token'],
                                          info.params['oauth_token_secret'])

    client = Youroom::Request.new(access_token)
    logger.info client.get_my_group.body
    render :json => client.get_my_group.body
  end

end
