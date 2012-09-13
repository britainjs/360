# Unit tests for a suite of ruby programs

require 'test/unit'
require './scramble.rb'
require './strip_vowels.rb'
require './powers_of_two.rb'
require './powers.rb'
require './interleave.rb'
require './stutter.rb'

class String
  def is_permutation_of(other)
    self.split(//).sort == other.split(//).sort
  end
end

class TestUtil < Test::Unit::TestCase

  def test_strip_vowels()
    assert_equal(strip_vowels(""), "");
    assert_equal(strip_vowels("ouT"), "T");
    assert_equal(strip_vowels("appLe"), "ppL");
    assert_equal(strip_vowels("BastIon"), "Bstn");
    assert_equal(strip_vowels("canTiCle"), "cnTCl");
    assert_equal(strip_vowels("DOGMA"), "DGM");
    assert_equal(strip_vowels("eNiGmA"), "NGm");
    assert_equal(strip_vowels("freud"), "frd");
    assert_equal(strip_vowels("galahad"), "glhd");
    assert_equal(strip_vowels("hanger"), "hngr");
    assert_equal(strip_vowels("Iridium"), "rdm");
    assert_equal(strip_vowels("Jackal"), "Jckl");
    assert_equal(strip_vowels("Kombat"), "Kmbt");
    assert_equal(strip_vowels("LumInOUS"), "LmnS");
    assert_equal(strip_vowels("MagNANimous"), "MgNNms");
    assert_equal(strip_vowels("NagasakI"), "Ngsk");
    assert_equal(strip_vowels("OaEiOOOu"), "");
    assert_equal(strip_vowels("particle"), "prtcl");
    assert_equal(strip_vowels("qUESt"), "qSt");
    assert_equal(strip_vowels("Rhapsody"), "Rhpsdy");
    assert_equal(strip_vowels("syzygy"), "syzygy");
    assert_equal(strip_vowels("tachycardia"), "tchycrd");
    assert_equal(strip_vowels("undulate"), "ndlt");
    assert_equal(strip_vowels("vELOCITY"), "vLCTY");
    assert_equal(strip_vowels("WindigO"), "Wndg");
    assert_equal(strip_vowels("xylem"), "xylm");
    assert_equal(strip_vowels("yellow"), "yllw");
    assert_equal(strip_vowels("zygote"), "zygt");
    assert_equal(strip_vowels("District9"), "Dstrct9");
    assert_equal(strip_vowels("Blink 182"), "Blnk 182");
  end

  def test_scramble()
    ["", "a", "aaaa", "aaba", "abfswegwtewr"].each do |s|
      assert(s.is_permutation_of(scramble(s)))
    end
    assert(!"abc".is_permutation_of(scramble("aab")))
  end

  def test_powers_of_two()
    test = []
    powers_of_two(70) {|x| test.push(x)}
    assert_equal(test, [1,2,4,8,16,32,64])
    test.clear
    powers_of_two(20) {|x| test.push(x)}
    assert_equal(test, [1,2,4,8,16])
    test.clear
    powers_of_two(0) {|x| test.push(x)}
    assert_equal(test, [])
    test.clear
    powers_of_two(50) {|x| test.push(x)}
    assert_equal(test, [1,2,4,8,16,32])
    test.clear
    powers_of_two(5) {|x| test.push(x)}
    assert_equal(test, [1,2,4])
    test.clear
    powers_of_two(150) {|x| test.push(x)}
    assert_equal(test, [1,2,4,8,16,32,64,128])
  end

  def test_powers()
    test = []
    powers(3,400) {|x| test.push(x)}
    assert_equal(test, [1,3,9,27,81,243])
    test.clear
    powers(0, 0) {|x| test.push(x)}
    assert_equal(test, [])
    test.clear
    powers(2, 70) {|x| test.push(x)}
    assert_equal(test, [1,2,4,8,16,32,64])
    test.clear
    powers(1, 10000) { |x| test.push(x)}
    assert_equal(test, [])
    test.clear
    powers(4, 500) {|x| test.push(x)}
    assert_equal(test, [1,4,16,64,256])
  end

  def test_interleave()
    assert_equal(interleave([1, 2], [nil, 5, 7, 10]), [1, nil, 2, 5, 7, 10])
    assert_equal(interleave([1,2,3,4,5], [1,2,3,4,5]), [1,1,2,2,3,3,4,4,5,5])
    assert_equal(interleave(["ape", "cat"], ["baboon", "dog"]), ["ape", "baboon","cat",
        "dog"])
    assert_equal(interleave([true, "zoom", 52], [nil, 'h', :cat]), [true, nil, "zoom",
        'h', 52, :cat])
    assert_equal(interleave([1,"abcd", :roomba], [-1, "wxyz", :dust]), [1, -1, "abcd",
        "wxyz", :roomba, :dust])
    assert_equal(interleave([], []), [])
    assert_equal(interleave([1], []), [1])
    assert_equal(interleave([], ["all alone"]), ["all alone"])
    assert_equal(interleave(["all", "all", "just", "brick", "the"], ["in", "you're",
        "another", "in", "wall"]), ["all", "in", "all", "you're", "just", "another",
        "brick", "in", "the", "wall"])
    assert_equal(interleave([1,2,3,4,5,6,7,8,9,10], ["one", "two", "nevermind"]),
        [1,"one",2,"two",3,"nevermind", 4,5,6,7,8,9,10])
  end

  def test_stutter()
    assert_equal([1, 1].stutter, [1, 1, 1, 1]);
    assert_equal(["na", "na", "na"].stutter, ["na", "na", "na", "na", "na", "na"]);
    assert_equal([1,2,3,4].stutter, [1,1,2,2,3,3,4,4]);
    assert_equal([:cat, :dog, :illithid].stutter, [:cat, :cat, :dog, :dog, :illithid,
        :illithid] )
    assert_equal(["oompah", "loompah", "doompity doo"].stutter, ["oompah", "oompah",
        "loompah", "loompah", "doompity doo", "doompity doo"])
    assert_equal([nil, 1, "woot", [1, 2], :WOOT].stutter, [nil, nil, 1, 1, "woot", "woot",
        [1,2], [1,2], :WOOT, :WOOT])
    assert_equal([].stutter, [])
    assert_equal([nil, nil, 1,1, "cat", "cat"].stutter, [nil, nil, nil, nil, 1, 1, 1, 1,
        "cat", "cat", "cat", "cat"])
  end

end