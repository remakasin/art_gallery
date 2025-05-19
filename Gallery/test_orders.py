import unittest
import re
from orders import is_valid_phone

def is_valid_name(name):
    return re.fullmatch(r'[A-Za-z]{2,50}', name)

def is_valid_description(description):
    return 8 <= len(description) <= 100

class TestPhoneValidation(unittest.TestCase):

    def test_valid_phone_number(self):
        valid_phone = "+7(999)123-45-67"
        self.assertTrue(is_valid_phone(valid_phone))

    def test_invalid_phone_number_format(self):
        invalid_phone = "89991234567"
        self.assertFalse(is_valid_phone(invalid_phone))

    def test_empty_phone_number(self):
        self.assertFalse(is_valid_phone(""))

    def test_missing_country_code(self):
        self.assertFalse(is_valid_phone("(999)123-45-67"))

class TestFormValidation(unittest.TestCase):

    def test_valid_name(self):
        self.assertTrue(is_valid_name("Michael"))

    def test_invalid_name_too_short(self):
        self.assertFalse(is_valid_name("A"))

    def test_invalid_name_with_digit(self):
        self.assertFalse(is_valid_name("John1"))

    def test_valid_description(self):
        self.assertTrue(is_valid_description("This is a valid description."))

    def test_invalid_description_too_short(self):
        self.assertFalse(is_valid_description("Short"))

    def test_empty_fields(self):
        self.assertFalse(is_valid_name(""))
        self.assertFalse(is_valid_description(""))
        self.assertFalse(is_valid_phone(""))

if __name__ == '__main__':
    unittest.main()
