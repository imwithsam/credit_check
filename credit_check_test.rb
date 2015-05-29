require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CreditCheckTest < Minitest::Test
  def test_checks_for_nil_card_number
    card_number = nil
    refute valid?(card_number), "Nil card number is NOT valid."
  end

  def test_checks_for_empty_card_number
    card_number = ""
    refute valid?(card_number), "Empty card number is NOT valid."
  end

  def test_checks_for_non_integer_card_number
    card_number = "abcdabcdabcdabcd"
    refute valid?(card_number), "Non-integer card number is NOT valid."
  end

  def test_validates_correct_card_number_test_1
    card_number = "5541808923795240"
    assert valid?(card_number), "5541808923795240 IS a valid card number."
  end

  def test_validates_correct_card_number_test_2
    card_number = "4024007136512380"
    assert valid?(card_number), "4024007136512380 IS a valid card number."
  end

  def test_validates_correct_card_number_test_3
    card_number = "6011797668867828"
    assert valid?(card_number), "6011797668867828 IS a valid card number."
  end

  def test_invalidates_incorrect_card_number_test_1
    card_number = "5541801923795240"
    refute valid?(card_number), "5541801923795240 is NOT a valid card number."
  end

  def test_invalidates_incorrect_card_number_test_2
    card_number = "4024007106512380"
    refute valid?(card_number), "4024007106512380 is NOT a valid card number."
  end

  def test_invalidates_incorrect_card_number_test_3
    card_number = "6011797668868728"
    refute valid?(card_number), "6011797668868728 is NOT a valid card number."
  end

  def test_validates_correct_amex_card_number
    card_number = "342804633855673"
    assert valid?(card_number), "342804633855673 IS a valid card number."
  end

  def test_invalidates_incorrect_amex_card_number
    card_number = "342801633855673"
    refute valid?(card_number), "342801633855673 is NOT a valid card number."
  end
end
