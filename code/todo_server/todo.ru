require "sqlite3"
DB_NAME = "todolist.db"

class Tasks
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /tasks/
      [200, {"Content-Type" => "text/html"}, ["<html><head><meta charset='utf-8'><head><body>#{my_tasks}</body></html>"]]
    else
      [404, {"Content-Type" => "text/html"}, ["I'm Lost!"]]
    end
  end

  def my_tasks
    db = SQLite3::Database.new DB_NAME

    rows = db.execute("select id, task, done from tasks")

    list = "<ul>"

    rows.each do |row|
      task_info = "<li>#{row[0]} - #{row[1]} - "
      task_info += (row[2] == 1) ? "сделано" : "не сделано"
      task_info += "</li>"
      list << task_info
    end

    list << "</ul>"
    list
  end
end

run Tasks.new
