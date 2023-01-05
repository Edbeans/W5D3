require_relative 'questions_database'
require_relative "users"
class Question 

    attr_reader :id 
    attr_accessor :title, :body, :associate_authors_id
    
    def self.find_by_id(question_id) # shows all id's in our questions data table 
        questions_data = QuestionsDatabase.instance.execute(<<-SQL, id: question_id) 
        SELECT
            *
        FROM 
            questions
        WHERE 
            id = :id
        SQL
        
        Question.new(questions_data.first)
    end

    def self.find_by_author_id(associated_authors_id)
        questions_data = QuestionsDatabase.instance.execute(<<-SQL, associated_authors_id)
        SELECT
            *
        FROM
            questions
        WHERE
            associated_authors_id = ? 
        SQL

        questions_data.map { |data| Question.new(data) }
    end
    
    def initialize(options) # creates a new instance of our question class 
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @associated_authors_id = options['associated_authors_id']
    end
    
end