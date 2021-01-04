class API

    def self.get_data
        response = RestClient.get('https://opentdb.com/api.php?amount=50&type=multiple')
        questions_array = JSON.parse(response)["results"]
        questions_array.each do |trivia|
            TriviaQuestion.new(trivia["category"], trivia["question"], trivia["correct_answer"], trivia["incorrect_answers"])
        end       
        
    end

end
