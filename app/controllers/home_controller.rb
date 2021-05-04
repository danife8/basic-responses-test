class HomeController < ApplicationController
  before_action :get_social_media_data, only: :index

  def index
    @tw_body = get_body_from_request(@twitter)
    @fb_body = get_body_from_request(@facebook)
    @ig_body = get_body_from_request(@instagram)
    render formats: :json
  end

  private 

  def get_social_media_data
    conn = Faraday.new('https://www.takehome.io/', request: { timeout: 5 })
    @twitter = conn.get('twitter')
    @facebook = conn.get('facebook')
    @instagram = conn.get('instagram')
  end

  def get_body_from_request(response)
    if response.success?
      return JSON.parse(response.body)      
    else
      return [{}]
    end

    rescue JSON::ParserError
    return [{}]
  end
end
