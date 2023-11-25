require "./algorithms/sort/*"
require "./algorithms/shuffle/*"
require "option_parser"

# TODO: Write documentation for `Computer::Science`
module Computer::Science
  VERSION = "0.1.0"

  class Algorithms
    @@section : String | Nil
    @@algorithm : String | Nil
    @@suffle_algorithm : String | Nil

    def main
      choose_section()
    end

    def choose_section
      puts "Choose section:"
      puts "1 - Sorting"
      puts "2 - Shuffle"
      puts "q - quit"
      print "> "
      input = gets
      @@section = nil
      case input
      when "1"
        @@section = "Sorting"
      when "2"
        @@section = "Shuffle"

      when "q"
        exit
      else
        exit
      end

      case @@section
      when "Sorting"
        choose_sorting_alg()
      when "Shuffle"
        choose_shuffle_algorithm()
      when "q"
        exit
      else
        exit
      end
    end

    def choose_shuffle_algorithm()
      puts "Choose algorithm:"
      puts "1 - Fisher-Yates shuffle"
      puts "q - quit"
      print "> "
      input = gets
      @@suffle_algorithm = nil

      case input
      when "1"
        @@suffle_algorithm = "Fisher-Yates"
      when "q"
        exit
      else
        exit
      end

      case @@suffle_algorithm
      when "Fisher-Yates"
        Shuffle::FisherYates.run

        exit
      else
        exit
      end

    end

    def choose_sorting_alg
      puts "Choose algorithm:"
      puts "1 - Selection sort"
      puts "2 - Insertion sort"
      puts "3 - Merge sort"
      puts "q - quit"
      print "> "
      input = gets
      @@algorithm = nil

      case input
      when "1"
        @@algorithm = "Selection"
      when "2"
        @@algorithm = "Insertion"
      when "3"
        @@algorithm = "Merge"
      when "q"
        exit
      else
        exit
      end

      case @@algorithm
      when "Selection"
        Sort::Selection.run
      when "Insertion"
        Sort::Insertion.run
      when "Merge"
        Sort::Merge.run
      when "q"
        exit
      else
        exit
      end
    end
  end
end

shout = false

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to The Beatles App!"

  parser.on "-v", "--version", "Show version" do
    puts "version 1.0"
    exit
  end
  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-cs", "--cs", "Run Computer Science" do
    shout = true
  end
  parser.missing_option do |option_flag|
    puts parser
    exit
  end
  parser.invalid_option do |option_flag|
    puts parser
    exit(1)
  end
end

exit if !shout
algorithms = Computer::Science::Algorithms.new
algorithms.main
