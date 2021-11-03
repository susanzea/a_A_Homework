require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    self.all.each { |play_inst| return play_inst if play_inst.title == title }
    return "Sorry, play not found."
  end


  def self.find_by_playwright(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      plays
    JOIN playwrights ON plays.playwright_id = playwrights.id
    WHERE
      playwrights.name = ?
    SQL

    pw_id = data
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

# p Play.all
# p Play.find_by_title("All My Sons")
# p Play.find_by_playwright("Arthur Miller")


class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('playwrights.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright

  attr_accessor :birth_year, :playwright_id, :name
  def self.all
    data = PlaywrightDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    self.all.each { |playwright_inst| return playwright_inst if playwright_inst.name == @name }
    return "Sorry, playwright not found."
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
      raise "#{self} already in database" if self.id
      PlaywrightDBConnection.instance.execute(<<-SQL, self.play_wright, self.year, self.playwright_id)
        INSERT INTO
          plays (title, year, playwright_id)
        VALUES
          (?, ?, ?)
      SQL
      self.id = PlayDBConnection.instance.last_insert_row_id
  end




end

# p Playwright.all