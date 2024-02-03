from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv

load_dotenv()

def session_data():
    engine = create_engine('postgresql://postgres:postgres@localhost:5432/hearme_db')
    Session = sessionmaker(bind=engine)
    return Session()