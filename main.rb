# rubocop:disable Metrics/CyclomaticComplexity
require './book'
require './person'
require './student'
require './teacher'
require './classroom'
require 'colorize'


class Main
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def start
    options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
               'List all rentals for a given person ID', 'Exit']
    puts "\n\nWelcome to School Library App! \n\nPlease choose an option by entering a number"
    options.each_with_index.map { |option, index| puts "#{index + 1} - #{option}" }
    user_option = gets.chomp
    execute_option(user_option)
  end

  def execute_option(option)
    case option
    when '1' then show_book_list
    when '2' then show_people_list
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then show_rentals_for_person
    when '7' then puts 'See you soon!'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '.blue
    status = gets.chomp
    print 'Age: '.blue
    age = gets.chomp
    print 'Name: '.blue
    name = gets.chomp
    if status == '1'
      print 'Has a parent permission? [Y/N] '.blue
      permission = gets.chomp.downcase
      @people_list << Student.new(age, name, parent_permission: permission == 'y')
      puts 'Student has been created successfully'.green
    else
      print 'Specialization: '.blue
      spec = gets.chomp
      @people_list << Teacher.new(spec, age, name)
      puts 'Teacher has been created successfully'.green
    end

    start
  end
  end