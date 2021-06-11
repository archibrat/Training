ROMAN_MAP = (
        ('M', 1000), ('CM', 900), ('D', 500), ('CD', 400), ('C', 100),
        ('XC', 90), ('L', 50), ('XL', 40), ('X', 10), ('IX', 9), ('V', 5),
        ('IV', 4), ('I', 1)
)
def solution(roman):
    result = 0
    index = 0
    for rom, arab in ROMAN_MAP:
        while roman[index : index+len(rom)] == rom:
            result += arab
            index += len(rom)
    return result
