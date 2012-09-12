# Unit tests for a suite of ruby programs

require 'test/unit'
require 'misc.rb'

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
    assert_equal(strip_vowels("qUESt"), "qst");
    assert_equal(strip_vowels("Rhapsody"), "Rhpsdy");
    assert_equal(strip_vowels("syzygy"), "syzygy");
    assert_equal(strip_vowels("tachycardia"), "tchycrd");
    assert_equal(strip_vowels("undulate"), "ndlt");
    assert_equal(strip_vowels("vELOCITY"), "vlcty");
    assert_equal(strip_vowels("WindigO"), "Wndg");
    assert_equal(strip_vowels("xylem"), "xylm");
    assert_equal(strip_vowels("yellow"), "yllw");
    assert_equal(strip_vowels("zygote"), "zygte");
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
    # TODO
  end

  def test_powers()
    # TODO
  end

  def test_interleave()
    assert_equal(interleave([1, 2], [nil, 5, 7, 10]), [1, nil, 2, 5, 7, 10])
    assert_equal(interleave([1,2,3,4,5], [1,2,3,4,5]), [1,1,2,2,3,3,4,4,5,5])
    assert_equal(interleave(["apple", 1, nil], ["pie", 2, nil]), ["apple", "pie", 1, 2
        , nil, nil])
    assert_equal(interleave(['a', 255, "cat"], ['b', 0, "dog", nil]), ['a', 'b', 255, 
        0, "cat", "dog", nil])
    assert_equal(interleave(['a', 'c', 'e', 'g'], ['b', 'd', 'f', 'h']), ['a', 'b', 
        'c', 'd', 'e', 'f', 'g', 'h']) 
  end

  def test_stutter()
    assert_equal([1, 1].stutter, [1, 1, 1, 1]);
    assert_equal(["na", "na", "na"].stutter, ["na", "na", "na", "na", "na", "na"]);
    assert_equal([1,2,3,4].stutter, [1,1,2,2,3,3,4,4]);
  end

end