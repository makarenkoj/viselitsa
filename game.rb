# encoding: UTF-8

class Game
  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0

  end

  def get_letters(slovo)
    if slovo == nil || slovo == ""
      abort "Загадано пустое слово, нечего отгадывать. Закрываемся"

    end

    return slovo.encode('UTF-8').downcase.split("")

  end

  def status
    return @status

  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return

    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return

    end

    letters_with_dots = ""
    case bukva
    when "е"
      letters_with_dots = "ё"
    when "ё"
      letters_with_dots = "е"
    when "и"
      letters_with_dots = "й"
    when "й"
      letters_with_dots = "и"
    end

    if @letters.include?(bukva) || @letters.include?(letters_with_dots)
      @good_letters << bukva

      if letters_with_dots != ""
        @good_letters << letters_with_dots

      end

      if (@letters - @good_letters).empty?
        @status = 1

      end

    else

      @bad_letters << bukva

      if letters_with_dots != ""
        @bad_letters << letters_with_dots

      end

      @errors += 1

      if @errors >= 7
        @status = -1

      end
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ""
    while letter == ""
      letter = STDIN.gets.encode("UTF-8").downcase.chomp
    end
    next_step(letter)
  end

  def errors
    @errors
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

end
