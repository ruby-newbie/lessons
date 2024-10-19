class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    response = ['<html><h1>Greetings from Rack!!</h1></html>']
    [200, headers, response]
  end
end

run App.new
