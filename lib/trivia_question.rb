class TriviaQuestion
    attr_accessor :category
    attr_reader :question, :correct_answer, :incorrect_answers, :questions_in_category

    @@all = []


    def initialize(category, question, correct_answer, incorrect_answers)
        @category = category
        self.question = question
        self.correct_answer = correct_answer
        self.incorrect_answers = incorrect_answers
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def question=(question)
        
        @question = question.split(" ").map do |word|
            if word.include?("&#039;") 
                word.gsub("&#039;", "'")
            elsif word.include?("&quot;")
                word.gsub("&quot;", '"')
            elsif word.include?("&amp;")
                word.gsub("&amp;", "&")
            elsif word.include?("&deg;")
                word.gsub("&deg;", " degrees ")
            else
                word
            end
        end.join(" ")
    end

    def correct_answer=(correct_answer)
        @correct_answer = correct_answer.split(" ").map do |word|
            if word.include?("&#039;") 
                word.gsub("&#039;", "'")
            elsif word.include?("&quot;")
                word.gsub("&quot;", '"')
            elsif word.include?("&amp;")
                word.gsub("&amp;", "&")
            elsif word.include?("&deg;")
                word.gsub("&deg;", " degrees ")
            else
                word
            end
        end.join(" ")
    end

    def incorrect_answers=(incorrect_answers)
        @incorrect_answers = incorrect_answers.map do |word|
            if word.include?("&#039;") 
                word.gsub("&#039;", "'")
            elsif word.include?("&quot;")
                word.gsub("&quot;", '"')
            elsif word.include?("&amp;")
                word.gsub("&amp;", "&")
            elsif word.include?("&deg;")
                word.gsub("&deg;", " degrees ")
            else
                word
            end
        end
    end

    def self.questions_in_category(category)
        self.all.select{|q| q.category == category}
    end

    def self.random_question(question)
        puts "#{"#{question.question}".cyan.bold}"
         answers = []
         answers << question.correct_answer
         answers << question.incorrect_answers
         randomized = answers.flatten.shuffle
         q_a = {q: question, a: randomized}
         randomized.each.with_index do |answer, i|
                puts "#{"#{i + 1}".bold.light_magenta}. #{answer}"
         end
         q_a    
    end

    def self.check_answer(q_a, input) 
        true if q_a[:q].correct_answer == input
    end


   
end