module Text
  def welcome_words
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def game_instructions
    puts "Mastermind consists on guessing a secret code that consists in four elements containing R(red), Y(yellow), B(blue), G(green).
    Please select(p)lay, read the (i)nstructions, or (q)uit."
  end

  def user_menu
    puts "Please select(p)lay, read the (i)nstructions, or (q)uit."
  end

  def code_structure
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def try_again
    puts "Please write a 4 character password using R,B,Y,G."
  end

  def input_too_long
    puts "The password is too long. It should be 4 characters."
  end

  def input_too_short
    puts "The password is too short. It should be 4 characters."
  end

  def cheat(code)
    puts "The secret code is #{code}"
  end

  def bye
    puts "See you soon."
  end

  def feedback(input, correct_position, correct_content, tries)
    puts "#{input} has #{correct_content} of the correct elements with #{correct_position} in the correct positions.
    You've taken #{tries} guess. Enter a new guess or (q)uit."
  end

  def congrats(code, tries, minutes, seconds)
    puts "Congratulations! You guessed the sequence #{code} in #{tries} guesses over #{minutes} minutes,
    #{seconds} seconds. Do you want to (p)lay again or (q)uit?"
  end
end
