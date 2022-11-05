cook_book = {}

with open ('recipes.txt' , encoding='utf-8') as file:
   for l in file:
        dish = l.strip()
        list_products =[]
        ingrid_count = file.readline()
        for i in range(int(ingrid_count)):
            ingridient = file.readline()
            ingredient_name , quantity , measure = ingridient.strip().split(' | ')
            list_products.append({'ingredient_name': ingredient_name , 'quantity': quantity, 'measure': measure})
        blank = file.readline()
        cook_book[dish] = list_products
print(cook_book)





def get_shop_list_by_dishes(dishes, person_count):
    cook_dict = {}
    for name_dish in cook_book.keys():

        for ingridient in cook_book[dish]:
            if ingridient['ingredient_name'] in cook_dict:
                cook_dict['ingredient_name']['quantity'] += ingridient['quantity']

            else:
                cook_dict = {ingridient['ingredient_name']: {ingridient['quantity'], ingridient['measure']}}
                print(cook_dict)
            for ingredient in cook_dict.keys():
                person = ingridient['quantity'] * person_count
#
# get_shop_list_by_dishes(['Омлет'], 2)



            # print(ingridient)
        # for ingridient in cook_book[dish]:
        #     print()





 # get_shop_list_by_dishes(['Запеченный картофель', 'Омлет'], 2)
# {
#   'Картофель': {'measure': 'кг', 'quantity': 2},
#   'Молоко': {'measure': 'мл', 'quantity': 200},
#   'Помидор': {'measure': 'шт', 'quantity': 4},
#   'Сыр гауда': {'measure': 'г', 'quantity': 200},
#   'Яйцо': {'measure': 'шт', 'quantity': 4},
#   'Чеснок': {'measure': 'зубч', 'quantity': 6}
# # }

# person = input('Введите кол-во гостей: ')
