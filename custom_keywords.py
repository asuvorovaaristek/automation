# custom_keywords.py

from robot.api.deco import keyword

@keyword
def sort_dictionary_by_values(dictionary):
    return dict(sorted(dictionary.items(), key=lambda item: item[1], reverse=True))

