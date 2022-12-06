import pytest
from csv_csv import show_csv,avg_age

def test_wrong_age():
    with pytest.raises(ZeroDivisionError):
        assert avg_age()

def show_error():
    with pytest.raises(FileNotFoundError):
        show_csv()