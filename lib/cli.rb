class CLI

    attr_reader :score, :q

    def initialize
        @score = 0
    end

    def run
        puts " "
        puts " "
        puts "~~~~~~~~~~~~~~~~~~~~~~~~".yellow.on_blue
        puts " Welcome to CLI Trivia! ".white.on_blue.bold
        puts "~~~~~~~~~~~~~~~~~~~~~~~~".yellow.on_blue
        puts " "
        puts " "
        list_categories
    end

    def sorted_categories
        categories = TriviaQuestion.all.uniq{|question| question.category}
        sorted = categories.sort_by{|question| question.category}
    end

    def list_categories 
        puts "What number category would you like to choose?".light_green.bold
        sorted_categories.each.with_index(1){|question, i| puts "#{"#{i}".bold.light_magenta}. #{question.category}"}
        get_category
    end

    def get_category
        input = gets.strip.to_i
        if input.between?(1, sorted_categories.count)
            @q = sorted_categories[input - 1]
        else
            puts "Hmm.. that's not a valid input.  Try again"
            list_categories
        end
        # @q returns the question + category
        # need to pass this to get category questions for array of questions
        @qs = TriviaQuestion.questions_in_category(@q.category)
        create_question
    end
    def create_question
        qs = @qs.pop
        @q_a = TriviaQuestion.random_question(qs)
        check_question
    end 
    def check_question
        input = gets.strip.to_i - 1
        answer = TriviaQuestion.check_answer(@q_a, @q_a[:a][input])
        if answer && input.between?(0, 3)
            puts "You got it!"
            @score += 1
            puts "Your score is: #{"#{@score}".bold}".cyan
            another_question?
        elsif input.between?(0, 3)
            puts "#{"Not quite".light_red}, the correct answer was #{@q_a[:q].correct_answer.bold.green}"
            @score -= 1 if @score >= 1
            puts "Your score is: #{"#{@score}".bold}".cyan
            another_question?
        else
            puts "Hmm... that's not a valid response, #{"try again".bold}".light_red
            check_question
        end
    end
    def another_question?
        puts "Would you like another question from this category?"
        puts "Type #{"yes".light_green.bold}, #{"no".light_red.bold} or #{"exit".light_yellow.bold}"
        input = gets.strip
            if input == "exit"
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".yellow.on_blue
                puts "       Thanks for playing!      ".white.on_blue
                puts "    Your final score is : #{"#{@score}".bold}     ".white.on_blue
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".yellow.on_blue
                exit
            elsif input == "yes" && @qs.length == 0
                puts " "
                puts "Sorry, there are no more questions in that category.".white.on_magenta
                puts "                                                    ".white.on_magenta
                puts "Choose a different category number:                 ".yellow.on_magenta.bold
                puts " "
                list_categories
            elsif input == "yes" && @qs.length > 0
                create_question
            elsif input == "no"
                puts " "
                puts "Choose another category number:".yellow.on_magenta.bold
                puts " "
                list_categories
            else 
                puts "Hmm... that's not a valid response, #{"try again".bold}".light_red
                another_question?
            end
     end
        

end