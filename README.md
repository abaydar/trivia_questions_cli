## Welcome to CLI trivia

### Short Description 

This CLI app was designed to be an interactive version of multiple choice trivia.  You will choose a category from a list, recieve a question, submit your answer, and then get the correct answer.  If you answer correctly, your score will go up!  Answer incorrectly, and your score will go down (but not below zero!).

After your first question, you will recieve a prompt asking whether you would like another question from that category.  If you type `yes`, you will get an additional question (if there is one available*), if you type `no`, you will be sent back choose another category.  If you're all finished, you can type `exit` to exit the app and recieve your final score.

*Please note that due to the nature of the API, only 50 questions are generated per session.  Therefore, some categories have fewer questions than others.  If you run out of questions in a particular category, you will recieve a prompt letting you know and then be asked to select a different category.

### Install instructions

In your terminal, clone the project by typing `git clone <git@github.com:abaydar/trivia_questions_cli.git>`.  
Once you are in the correct directory, run `bundle install` to load the gems.  
To run the app, type `ruby bin/start_trivia` in your terminal

### A Contributor's Guide

For pull requests, please visit: (https://github.com/abaydar/trivia_questions_cli/pulls).  
For bug reports, please visit: (https://github.com/abaydar/trivia_questions_cli/issues)

### License 
This application is available as open source under the terms in the MIT License, found here: (https://opensource.org/licenses/MIT)
