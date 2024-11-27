require "sqlite3"
DB_NAME = "todo.db"

db = SQLite3::Database.new DB_NAME

rows = db.execute("select id, task, done from tasks")

rows.each do |row|
  if row[2] == 0
    puts "не "
  end
  puts "сделано - #{row[1]}"
  puts "-------"
end
