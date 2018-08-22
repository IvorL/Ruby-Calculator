# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
require 'spec_helper'

describe "Testing the calc engine" do

  before(:all) do
    @calc = CalcEngine.new()
  end

  it "should add two numbers together" do
    expect(@calc.add_two_numbers(1,1)).to eq(2)
  end

  it "should subtract two numbers" do
    expect(@calc.subtract_two_numbers(2,1)).to eq(1)
  end

  it "should multiply two numbers together" do
    expect(@calc.multiply_two_numbers(2,3)).to eq(6)
  end

  it "should divide two numbers" do
    expect(@calc.divide_two_numbers(4,2)).to eq(2)
  end

  it "should perform a power operation on a number using the second as the exponent" do
    expect(@calc.power_two_numbers(2,3)).to eq(8)
  end

  it "should return the user's BMI" do
    expect(@calc.bmi_calculation(2,100)).to eq(25)
  end

  it "should divide two numbers" do
    expect(@calc.calculate_travel_time(100,50)).to eq(2)
  end

  # it "should perform a division on the first two numbers, then multiply it by the third" do
  #   expect(@calc.calculate_travel_cost()).to eq(5)
  # end
end
