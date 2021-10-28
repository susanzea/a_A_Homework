require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("brownie", 50, "Andres") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { dessert.quantity("50") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
   it "adds ingredient to list" do 
      dessert.add_ingredient("love")
      expect(dessert.ingredients).to eq(["love"])
   end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    dessert.add_ingredient("sugar")
    dessert.add_ingredient("spice") 
    dessert.add_ingredient("everything nice") 
    original_ingredients = dessert.ingredients[0..1]
    dessert.mix!
      expect(dessert.ingredients).to_not eq(original_ingredients)
   end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3) 
      expect(dessert.quantity).to eq(47)
    end
    it "raises an error if the amount is greater than the quantity" do 
      expect { dessert.quantity(51) }.to raise_error(ArgumentError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("Chef Andres the Great Baker")

      expect(dessert.serve).to eq("Chef Andres the Great Baker has made 50 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
