import psycopg2

    # Функция, создающая структуру БД (таблицы)
def create_db(conn):
        cur.execute ('''
            CREATE TABLE IF NOT EXISTS  base_client (
            id SERIAL PRIMARY KEY,
            first_name VARCHAR (30) NOT NULL,
            last_name VARCHAR (30) NOT NULL,
            email VARCHAR (50) UNIQUE);
                        ''')

        cur.execute('''
            CREATE TABLE IF NOT EXISTS  phone_client (
            id SERIAL PRIMARY KEY,
            id_client INT NOT NULL REFERENCES base_client(id),
            phone_num INT);
                        ''')


    # Функция, позволяющая добавить нового клиента
def add_client(conn, first_name, last_name, email, phones=None):
        cur.execute('''
            INSERT INTO base_client (
            first_name, last_name, email)
            VALUES  (%s, %s, %s)
            RETURNING id;
                        ''', (first_name, last_name, email))



    # Функция, позволяющая добавить телефон для существующего клиента
def add_phone(conn, id_client, phone_num):
        cur.execute('''
            INSERT INTO phone_client (id_client, phone_num) 
            VALUES (%s, %s);
                        ''', (id_client, phone_num))


    # Функция, позволяющая изменить данные о клиенте
def update_client(conn, first_name, id):
        cur.execute('''
            UPDATE base_client 
            SET first_name = %s
            WHERE id = %s;''',
                    (first_name, id))

def update_client(conn, last_name, id):
        cur.execute('''
           UPDATE base_client 
           SET last_name = %s
           WHERE id = %s;''',
                (last_name, id))

def update_client(conn,email, id):
        cur.execute('''
           UPDATE base_client 
           SET  email= %s
           WHERE id = %s;''',
                    (email, id))

def update_phone(conn, id_client, phone_num):
        cur.execute('''
            UPDATE phone_client 
            SET phone_num = %s
            WHERE id = %s; 
            ''', (id_client, phone_num))
        cur.execute('''
        SELECT * FROM phone_client
        ''')


    # Функция, позволяющая удалить телефон для существующего клиента
def delete_phone(conn, id_client=None, phone_num = None):
        cur.execute('''
            DELETE FROM phone_client
            WHERE id = %s or phone_num = %s;
                    ''',(id_client, phone_num))

    # Функция, позволяющая удалить существующего клиента
def delete_client(conn, id):
        cur.execute('''
            DELETE  FROM base_client
            WHERE id = %s;
        ''',(id))




    # Функция, позволяющая найти клиента по его данным (имени, фамилии, email-у или телефону)
def find_client(conn, first_name=None, last_name=None, email=None, phone_num=None):
    cur.execute('''
        SELECT first_name, last_name, email, phone_num 
        FROM base_client
        JOIN phone_client USING (id)
        WHERE first_name = %s or last_name = %s or email = %s or phone_num = %s
    ''', (first_name, last_name, email, phone_num))


from config import conn
with conn.cursor() as cur:
     create_db(conn)
     add_client(conn, 'Nikolai', 'Nik', 'Nik@m.ru', +12345678)
     add_phone(conn, 1, +12345678)
     update_client(conn,'Nikolai', 1)
     update_phone(conn, 1 , +87654321)
     delete_phone(conn,1, +87654321)
     delete_client(conn, '1')
     find_client(conn, 'Nik')
     conn.commit

