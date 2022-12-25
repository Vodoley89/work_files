import psycopg2


def drop_table(cur, *table):
    for t in table:
        cur.execute(f"DROP TABLE {t}")


# Функция, создающая структуру БД (таблицы)
def create_db(cur):
    cur.execute('''
            CREATE TABLE IF NOT EXISTS  base_client (
            id SERIAL PRIMARY KEY,
            first_name VARCHAR (30) NOT NULL,
            last_name VARCHAR (30) NOT NULL,
            email VARCHAR (50) UNIQUE,
            phones INT 
            );
            
            CREATE TABLE IF NOT EXISTS  phone_client (
            id_phone SERIAL PRIMARY KEY,
            id_client INT REFERENCES base_client(id) ON DELETE CASCADE,
            phone INT );   
            ''')


# Функция, позволяющая добавить нового клиента
def add_client(cur, first_name, last_name, email, phones=None):
    cur.execute('''
            INSERT INTO base_client 
            (first_name, last_name, email)
            VALUES  (%s, %s, %s) ;
                        ''', (first_name, last_name, email))


    if phones:
        cur.execute("""
            INSERT INTO phone_client( phone)
            VALUES ( %s);
            """, ( phones,))



# Функция, позволяющая добавить телефон для существующего клиента
def add_phone(cur, id_client, phone):
    cur.execute('''
            INSERT INTO phone_client(id_client, phone)
            VALUES (%s, %s);
            ''', (id_client, phone))


# Функция, позволяющая изменить данные о клиенте
def update_client(cur, id, first_name=None, last_name=None, email=None, phones=None):
    if first_name != None:
        cur.execute('''
            UPDATE base_client 
            SET first_name = %s            
            WHERE id = %s;''',
                    (first_name, id))

    if last_name != None:
        cur.execute('''
           UPDATE base_client 
           SET last_name (%s) = values (%s) 
           WHERE id = %s;''',
                    (last_name, id))

    if email != None:
        cur.execute('''
           UPDATE base_client 
           SET  email= %s
           WHERE id = %s;''',
                    (email, id))

    if phones != None:
        cur.execute("""
                    UPDATE phone_client
                    SET phone = %s
                    WHERE id_client = %s
                    """, (phones, id))


# Функция, позволяющая удалить телефон для существующего клиента
def delete_phone(cur, id_phone):
    cur.execute('''
            DELETE FROM phone_client 
            WHERE id_phone = %s;
                    ''', ( id_phone,))


# Функция, позволяющая удалить существующего клиента
def delete_client(cur, id):
    cur.execute('''
              DELETE FROM base_client
              WHERE id = %s;
              ''', (id,))

             
                       



# Функция, позволяющая найти клиента по его данным (имени, фамилии, email-у или телефону)
def find_client(cur, first_name=None, last_name=None, email=None, phones=None):
    cur.execute(''' 
                SELECT * FROM base_client bc 
                JOIN  phone_client pc
                 ON pc.id_client = bc.id
                WHERE first_name =%s or last_name =%s or email =%s or phone =%s;
               ''', (first_name, last_name, email, phones))


    return cur.fetchall()



from config import conn
with conn.cursor() as cur:
    drop_table(cur , 'phone_client', 'base_client')
    create_db(cur)
    add_client(cur, 'Nikolai', 'Nik', 'Nik@m.ru')
    add_client(cur, 'Vasilij', 'Vas', 'Vas@m.ru')
    add_phone(cur, 1, 7777777)
    add_phone(cur, 2, 8888888)
    add_phone(cur,2, 9999999)
    add_phone(cur,2, 5555555)
    update_client(cur, first_name='Marina', id=1)
    update_client(cur,email='nevasya@j.com', id=2)
    delete_phone(cur, id_phone=4)
    delete_client(cur, id=1)
    find_client(cur, last_name='Nik')



    conn.commit()
