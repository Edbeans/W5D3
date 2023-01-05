require_relative 'questions_database'
require_relative 'questions'
require_relative 'users'

class Reply 

    def self.find_by_user_id(user_id) 
        replies_data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            user_id = ? 
        SQL

        # replies_data.map { |data| Reply.new(data) } 
        Reply.new(replies_data.first)
    end

    def self.find_by_question_id(question_id)
        replies_data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ? 
        SQL
        
        # replies_data.map { |data| Reply.new(data) }
        Reply.new(replies_data.first) 
    end

    attr_reader :id 
    attr_accessor :question_id, :parent_reply_id, :user_id, :body 
    
    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body'] 
    end


    

end