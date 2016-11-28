module Text
  def welcome_words
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def level_menu_options
    puts "Please select the difficulty level: B(beginner), I(intermediate) or A(advanced). You can also (q)uit anytime."
  end

  def game_instructions
    puts "Mastermind consists on guessing a secret code that:
    - For beginner level, it has four elements containing R(red), Y(yellow), B(blue), G(green).
    - For intermediate level, it has five elements containing R(red), Y(yellow), B(blue), G(green), P(purple).
    - For advance level, it has six characters containing R(red), Y(yellow), B(blue), G(green), P(purple), O(orange)
    Please select(p)lay or (q)uit."
  end

  def user_menu
    puts "Please select(p)lay, read the (i)nstructions, or (q)uit."
  end

  def code_structure_b
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def code_structure_i
    puts "I have generated an intermediate sequence with five elements made up of: (r)ed,
    (g)reen, (b)lue, (y)ellow, and (p)urple. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def code_structure_a
    puts "I have generated an advanced sequence with six elements made up of: (r)ed,
    (g)reen, (b)lue, (y)ellow, (p)urple and (o)range. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def try_again_b
    puts "Please write a 4 character password using R,B,Y,G."
  end

  def try_again_i
    puts "Please write a 5 character password using R,B,Y,G,P."
  end

  def try_again_a
    puts "Please write a 6 character password using R,B,Y,G,P,O."
  end

  def input_too_long_b
    puts "The password is too long. It should be 4 characters."
  end

  def input_too_long_i
    puts "The password is too long. It should be 5 characters."
  end

  def input_too_long_a
    puts "The password is too long. It should be 6 characters."
  end

  def input_too_short_b
    puts "The password is too short. It should be 4 characters."
  end

  def input_too_short_i
    puts "The password is too short. It should be 5 characters."
  end

  def input_too_short_a
    puts "The password is too short. It should be 6 characters."
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
