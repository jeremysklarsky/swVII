require "sw8/version"
require 'date'

module Sw8
  class StarWars

    def call
      my_seconds = Time.new(2017, 12, 15, 12, 0, 0, "+09:00") - Time.now

      seconds = 1
      minutes = seconds * 60
      hours = minutes * 60
      days = hours * 24

      days_str = (my_seconds / days).to_s
      hours_str = (('.' + days_str.split('.').last).to_f * days / hours).to_s
      minutes_str = (('.' + hours_str.split('.').last).to_f * hours / minutes).to_s 
      seconds_str = (('.' + minutes_str.split('.').last).to_f * minutes / seconds).to_s

      my_days = display(days_str)
      my_hours = display(hours_str)
      my_minutes = display(minutes_str)
      my_seconds = display(seconds_str)

      puts "There are #{my_days} days, #{my_hours} hours, #{my_minutes} minutes and #{my_seconds} seconds until Star Wars Episode VIII."
      puts "Today's predictions: #{predict}"
      puts "Quote of the day: #{greeting}"      
    end

    def display(str)
      str.split('.').first
    end

    def greeting
      greetings = ["I've got a bad feeling about this.", 'Never tell me the odds!', 'That is why you fail.', 'Now this is podracing!', 'Hold me, like you did on Naboo.', 'I don\'t like sand. It\'s coarse and it gets everywhere.', "It's a trap!", 'I know.', 'But I was going to Toshe Station to pick up some power converters!', "Aren't you a little short to be a stormtrooper?", "Uh, we had a slight weapons malfunction, but uh... everything's perfectly all right now. We're fine. We're all fine here now, thank you. How are you?", "You don't need to see his identification.", "We seem to be made to suffer. It's our lot in life.", "And you will drop your weapon!", "Crazy thing is, it's true. The Force, the Jedi, all of it. It's all true.", "Women always figure out the truth. Always."]

      greetings.sample
    end

    def predict
      questions = {
        :boba => {
          :question => 'Is Boba Fett Alive?',
          :answers => ['Yes.', 'No.']
        },
        :rey => {
          :question => 'Who is Rey\'s father?',
          :answers => ['Luke Skywalker. Duh.', 'She is a Kenobi.', 'She was born of the force.']
        },
        :snoke => {
          :question => 'Who is Snoke?',
          :answers => ['The Emperor, who survived his fall and went into hiding.', 'Darth Plagueis.', 'A corporeal incarnation of the dark side itself.', 'Luke Skywalker.']
        }
      }

      category = questions.keys.sample
      answer = questions[category][:answers].sample

      "Q: #{questions[category][:question]} A: #{answer}"
    end
  end
end
