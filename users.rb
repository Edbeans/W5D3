require_relative "questions_database"

class Users

    def self.find_by_name(fname, lname)
        names = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM    
            users
         WHERE
            fname = ? AND lname = ?
        SQL

        Users.new(names.first)

    end

    attr_reader :id
    attr_accessor :fname, :lname

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end
end