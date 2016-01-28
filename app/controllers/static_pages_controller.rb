class StaticPagesController < ApplicationController
  require 'net/http'

  def products
    url = URI.parse('http://seq-front-end-assessment.s3-website-us-west-2.amazonaws.com/catalog.json')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    response = JSON.parse(res.body)
    @products = response['products']
    @image_base_url = 'http://seq-front-end-assessment.s3-website-us-west-2.amazonaws.com/assets'
  end

end
