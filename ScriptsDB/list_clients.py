import psycopg2
from config import conn
with conn.cursor() as cur:
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
            INSERT INTO phone_client (id_client, phone_num) VALUES (%s, %s);
                        ''', (id_client, phone_num))

    # Функция, позволяющая изменить данные о клиенте
    def update_client(first_name):
        cur.execute('''
            UPDATE base_client 
            SET first_name = %s
            WHERE id = %s;''',
                    (first_name))

    def update_client(last_name):
        cur.execute('''
           UPDATE base_client 
           SET last_name = %s
           WHERE id = %s;''',
                (last_name))

    def update_client(email):
        cur.execute('''
           UPDATE base_client 
           SET  email= %s
           WHERE id = %s;''',
                    (email))

    def update_client(id_client, phone_num):
        cur.execute('''
            UPDATE phone_client 
            SET phone_num = %s
            WHERE id = %s; 
            ''', (id_client, phone_num))

    # Функция, позволяющая удалить телефон для существующего клиента
    def delete_phone(id_client, phone_num):
        cur.execute('''
            DELETE FROM phone_client
            WHERE id = %s;
                    ''',(id_client, phone_num))

    # Функция, позволяющая удалить существующего клиента
    def delete_client(conn, id):
        cur.execute('''
            DELETE FROM base_client(id)
            WHERE id = %s;
        ''',(id))

    # Функция, позволяющая найти клиента по его данным (имени, фамилии, email-у или телефону)
    def find_client(conn, first_name=None, last_name=None, email=None, phones=None):
        cur.exrcute('''
            SELECT first_name, last_name, email, phones 
            FROM base_client
            WHERE first_name = %s or last_name = %s or email = %s or phones = %s
        ''', (first_name, last_name, email, phones))

