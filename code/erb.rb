require "erb"

# шаблон
template = %(
  <html>
    <body>
      <h1>Сообщения для <%= name %></h1>
      <ul>
        <% messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </body>
  </html>
)

name = "Ruby Newbie"
messages = [
  "We meet every Monday night at 7pm",
  "We've almost completed the beginners course!",
  "Feel free to come by and join us!"
]

html = ERB.new(template).result(binding)
puts html
