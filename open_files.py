# Задание1ggg
import os
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

def open_files(*files):
    dict_line = {}
    for file in files:
        with open(file, encoding='utf-8') as f:
            lines = f.readlines()
            dict_line.update({file: len(lines)})
        dict_line2 = {}
        for i in sorted(dict_line, key=dict_line.get):
            dict_line2[i] = dict_line[i]

    return dict_line2


print(open_files('1.txt', '2.txt', '3.txt'))


def reader_files(*files):
    dict_txt = {}
    for i in open_files('1.txt', '2.txt', '3.txt'):
        with open(i, encoding='utf-8') as object:
            f = object.readlines()
            dict_txt.update({i: f})
    for key, val in dict_txt.items():
        with open('total.txt', 'a', encoding='utf-8') as total_file:
            total_file.writelines([f'{key}\n {len(val)}\n {val}\n'])
        # print(f'{key}\n{len(val)}\n{str(val)}')
    return total_file


print(reader_files('total.txt'))
