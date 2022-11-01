# Задание1
import pprint

cook_book = {}

with open('recipes.txt', encoding='utf-8') as file:
    for l in file:
        dish = l.strip()
        list_products = []
        ingrid_count = file.readline()
        for i in range(int(ingrid_count)):
            ingridient = file.readline()
            ingredient_name, quantity, measure = ingridient.strip().split(' | ')
            list_products.append({'ingredient_name': ingredient_name,
                                  'quantity': quantity,
                                  'measure': measure})
        blank = file.readline()
        cook_book[dish] = list_products
pprint.pprint(cook_book)


# Задание2
def get_shop_list_by_dishes(dishes, person_count):
    cook_dict = {}
    for dish in dishes:
        if dish in cook_book:
            for ingridient in cook_book[dish]:
                person = int(ingridient['quantity']) * person_count
                dict_list = {ingridient['ingredient_name']: {'measure': ingridient['measure'], 'quantity': person}}
                cook_dict.update(dict_list)
    return cook_dict


print(get_shop_list_by_dishes(["Омлет", 'Запеченный картофель'], 7))

# Заддание3

import os

