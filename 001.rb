# Multiples of 3 and 5
# ---------------------
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#

module Utility
  extend self

  def sum(a)
    # [3,5,6,9]
    a.reduce(0) {|acc, val| acc + val }
  end
end

class Array
  def multiples_of_3_and_5
    multiples_of_n(3) + multiples_of_n(5)
  end

  def multiples_of_n(n)
    select {|i| i % n == 0 }
  end
end

require 'minitest/autorun'
require 'minitest/pride'

describe "the problem" do
  it { Utility.sum((1...1000).to_a.multiples_of_3_and_5).must_equal 266333 }
end

describe Utility do
  subject { Utility }
  describe "#sum(a)" do
    it { subject.sum([3,5,6,9]).must_equal 23 }
  end
end

describe Array do
  subject { (1...10).to_a }

  it { subject.count.must_equal 9 }

  describe "#multiples_of_3_and_5" do
    it { subject.multiples_of_3_and_5.all? {|n| [3,5,6,9].include?(n) }.must_equal true }
  end

end
