require '../rayo/lib/rayo.rb'

require 'lib/tags/images_tags.rb'

require 'redcloth'

class Application < Rayo::Application

  configure do |c|
    c.content_dir = File.join( File.dirname(__FILE__), '..', 'content' )
    c.languages = ['ru','en']

    c.add_filter 'textile' do |source|
      RedCloth.new( source ).to_html
    end

    c.add_tags ImagesTags
  end

  set :public, File.join( File.dirname(__FILE__), '..', 'public' )

end