desc "Run JavaScript specs interactively"
task :k_test => :environment do
  # Konacha::Engine.routes.prepend do
  #   mount MagicLamp::Genie, at: "/magic_lamp"
  # end
  Konacha::Engine.routes.draw do
    mount MagicLamp::Genie, at: "/magic_lamp"
    get '/iframe/*name' => 'specs#iframe', :format => false, :as => :iframe
    root :to    => 'specs#parent'
    get '*path' => 'specs#parent', :format => false
  end
  # routes = Konacha::Engine.routes
  # old_routes = routes.router.routes
  # routes.clear!
  # require "pry"; binding.pry
  # routes.router.routes.routes += old_routes.routes
  # routes.router.routes.routes.each_with_index { |route, i| route.precendence = i }
  # # require "pry"; binding.pry
  Konacha.serve
end
