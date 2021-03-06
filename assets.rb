class App < Sinatra::Application

  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack

  set :sass, { :load_paths => [ "#{App.root}/assets/stylesheets" ] }
  set :scss, sass

  assets {
    serve '/js', from: 'assets/scripts'
    serve '/css', from: 'assets/stylesheets'
    serve '/images', from: 'assets/images'

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    # The final parameter is an array of glob patterns defining the contents
    # of the package (as matched on the public URIs, not the filesystem)
    js :application, '/js/app.js', [
        '/js/vendor/jquery.js',
        '/js/vendor/**/*.js',
        '/js/foundation/foundation.js',
        '/js/foundation/foundation.accordion.js',
        '/js/*.js'
    ]

    css :application, '/css/app.css', [
        '/css/vendor/normalize.css',
        '/css/foundation/foundation.css',
        '/css/*.css'
    ]

    js_compression :jsmin # :jsmin | :yui | :closure | :uglify
    css_compression :sass # :simple | :sass | :yui | :sqwish
  }
  
end
