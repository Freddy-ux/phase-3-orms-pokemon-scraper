class Pokemon
    require_relative "../db/db_connection"

class Pokemon
  attr_accessor :id, :name, :type

  def initialize(id:, name:, type:)
    @id = id
    @name = name
    @type = type
  end

  def self.save(name, type)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    DB.execute(sql, name, type)
  end

  def self.find(id)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    result = DB.execute(sql, id)[0]
    if result
      Pokemon.new(id: result[0], name: result[1], type: result[2])
    else
      nil
    end
  end
end

end
