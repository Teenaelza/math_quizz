
class Question
  attr_reader :questions

    def initialize()
      @questions = [ 
        { 
          id: 1,
          q:  "What is 5 plus 3 equals?",
          a:  8
        },
        {
          id: 2,
          q:"What is 5 times 3 equals?",
          a:15
        },
        {
          id: 3,
          q:  "What is 6 by 3 equals?",
          a:  2 
        },
        {
          id: 4,
          q:  "What is 10 minus 3 equals?",
          a:  7  
        }
      ]  
    end
    def get_question
      questions=@questions.shuffle
      questions.first
    end
  end