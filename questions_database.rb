require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database 
    include Singleton

    def initialize
        super("questions.db")
        self.type_translation = true # makes sure that all data that returns is the same data-type we input, string = string, integer = integer 
        self.results_as_hash = true  # the data will return as a hash, every column is a key, and data stored in that column is the value 
    end
end
    





