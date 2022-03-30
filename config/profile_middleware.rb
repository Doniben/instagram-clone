module Middleware
    class ProfileMiddleware
        def initialize(app)
            @app = app
        end
        
        def call(env)
            # check if 
            puts 'ProfileMiddleware'
            status, headers, response = @app.call(env)
            [status, headers, response]
        end
    end
end