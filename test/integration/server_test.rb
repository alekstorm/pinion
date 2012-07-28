require File.join(File.dirname(__FILE__), "../integration_test_helper.rb")

require "pinion/server"

module Pinion
  class ServerTest < Scope::TestCase
    include Rack::Test::Methods

    def server
      Server.new("/assets").tap do |s|
        s.watch "test/fixtures/js"
      end
    end

    def server_app(s)
      Rack::Builder.new do
        map("/assets") { run s }
      end
    end

    def app() @@app end

    context "in development mode" do
      setup do
        ENV["RACK_ENV"] = "development"
        @server = server
        @@app = server_app(@server)
      end

      context "static files" do
        should "be served unchanged" do
          get "/assets/app.js"
          assert_equal 200, last_response.status
          assert_equal %Q{console.log("hi!");\n}, last_response.body
        end
      end
    end

    context "in production mode" do
    end
  end
end
