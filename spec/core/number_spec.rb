require "spec_helper"

describe Unitize::Number do
  describe ".simplify" do
    it "simplifies to an Integer" do
      [2, 2.0, BigDecimal.new(2), Rational(2, 1), '2', '2.0'].each do |n|
        expect(Unitize::Number.simplify(n)).to be_equal(2)
      end
    end

    it "simplifies to a Float" do
      [2.25, BigDecimal.new('2.25'), Rational(9, 4), '2.25'].each do |n|
        expect(Unitize::Number.simplify(n)).to be_equal(2.25)
      end
    end

    it "doesn't simplify complex BigDecimals" do
      s = "1234567890.0123456789"
      d = BigDecimal.new(s)
      [s, d].each do |n|
        expect(Unitize::Number.simplify(n)).to be == d
      end
    end

    it "doesn't simplify complex Rationals" do
      r = Rational(22, 7)
      expect(Unitize::Number.simplify(r)).to be_equal(r)
    end
  end

  describe ".coefficify" do
    it "converts integer values to Integers" do
      [1, 1.0, "1.0", "1"].each do |n|
        expect(Unitize::Number.coefficify(n).eql?(1)).to be true
      end
    end

    it "converts decimal values to BigDecimals" do
      [1.5, "1.5", "1.50", "0.15e1"].each do |n|
        expect(Unitize::Number.coefficify(n).eql?(BigDecimal.new("1.5"))).to be true
      end
    end
  end

  describe ".rationalize" do
    it "coerces numbers to rationals" do
      [1.5, "1.5", BigDecimal.new("1.5")].each do |n|
        expect(Unitize::Number.rationalize(n)).to be == Rational(3, 2)
      end
    end
  end
end
