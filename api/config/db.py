from sqlalchemy import create_engine

def session_data():
    return create_engine('postgresql://postgres:postgres@localhost:5432/hearme_db')