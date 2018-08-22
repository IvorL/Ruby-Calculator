class CalcEngine

  def run_calculator
    puts "What calculator would you like to use? Enter (n) for numerical calculator, (b) for BMI calculator or (t) for trip calculator "
    user_calc_choice = gets.chomp
    # Runs a different calculator depending on player choice
    user_choice(user_calc_choice)
  end

  def user_choice(choice)
    if choice == 'n'
      # Run normal calculator
      numericalCalculator
    elsif choice == 'b'
      # Run BMI
      calculate_user_BMI
    elsif choice == 't'
      # Run trip calculator
      calculate_trip_time_and_distance
    else
      puts "Please enter a valid choice"
    end
  end

  def numericalCalculator
    puts "Enter a number: "
    user_first_number = gets.chomp.to_f
    puts "Enter an operator (enter '**' for power and 'sqrt' for square root): "
    user_operator = gets.chomp
    if user_operator != "sqrt"
      puts "Enter another number: "
      user_second_number = gets.chomp.to_f
    end

    case user_operator
    when "+"
      puts add_two_numbers(user_first_number, user_second_number)
    when "-"
      subtract_two_numbers(user_first_number, user_second_number)
    when "*"
      multiply_two_numbers(user_first_number, user_second_number)
    when "/"
      divide_two_numbers(user_first_number, user_second_number)
    when "**"
      power_two_numbers(user_first_number, user_second_number)
    when "sqrt"
      sqrt(user_first_number)
    else
      "Please enter a valid operator"
    end
  end

  def add_two_numbers(num1, num2)
    num1 + num2
  end

  def subtract_two_numbers(num1, num2)
    num1 - num2
  end

  def multiply_two_numbers(num1, num2)
    num1 * num2
  end

  def divide_two_numbers(num1, num2)
    num1 / num2
  end

  def power_two_numbers(num1, num2)
    num1 ** num2
  end

  def sqrt(num)
    num ** 0.5
  end


  def calculate_user_BMI
    puts "Enter (m) to enter detail using the metric system or (i) to use imperial"
    user_choice = gets.chomp
    if user_choice == 'm'
      puts "Enter your height in meters"
      user_height_metres = gets.chomp.to_i
      puts "Enter your weight in kg"
      user_weight_kg = gets.chomp.to_i

    elsif user_choice == 'i'
      puts "Enter your height in feet: "
      user_height_ft = gets.chomp.to_i
      puts "Enter your height in inches: "
      user_height_inches = gets.chomp.to_i
      puts "Enter your weight in pounds"
      user_weight_lbs = gets.chomp.to_i

      # Convert imperial to metric units for the BMI calculator
      user_height_metres = (user_height_ft + (user_height_inches/12))*0.3048
      user_weight_kg = user_weight_lbs/2.2

    end
    puts bmi_calculation(user_height_metres, user_weight_kg)
  end

  def bmi_calculation(user_height, user_weight)
    result = user_weight/user_height
    result/user_height
  end


   # Trip Calculator
  def calculate_trip_time_and_distance
    puts "Enter distance in miles"
    user_distance = gets.chomp.to_i
    puts "Enter your fuel efficiency in mpg"
    user_fuel_efficiency = gets.chomp.to_f
    puts "Enter fuel cost per gallon"
    user_cost_per_gallon = gets.chomp.to_f
    puts "Enter average speed"
    user_speed = gets.chomp.to_i

    time = calculate_travel_time(user_distance, user_speed)

    # If the user's speed is greater than 60mph
    # remove 2mpg from their fuel efficiency per 1mph over 60mph
    if user_speed > 60
      user_fuel_efficiency -= (user_speed - 60)*2
      if user_fuel_efficiency < 10
        user_fuel_efficiency = 5
      end
    end

    cost = calculate_travel_cost(user_cost_per_gallon, user_fuel_efficiency, user_distance)
    puts "Your trip will take #{time} hours and cost £#{cost}"
  end

  def calculate_travel_time(user_distance, user_speed)
    user_distance/user_speed
  end

  def calculate_travel_cost(user_cost_per_gallon, user_fuel_efficiency, user_distance)
    ((user_cost_per_gallon/user_fuel_efficiency)*user_distance)
  end

end # end of class

# calc = CalcEngine.new()
# calc.run_calculator
