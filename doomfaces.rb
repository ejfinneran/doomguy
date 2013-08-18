require 'sinatra/base'

class Doomfaces < Sinatra::Base

  set :root, File.dirname(__FILE__)

  get %r{/value/(\d+)} do
    damage = [99, params[:captures].first.to_i].min
    redirect to("/face/#{damage/20}")
  end

  (0..5).to_a.each do |i|
    get "/face/#{i}" do
      content_type "image/gif"
      send_file "images/face#{i}.gif"
    end
  end
end
