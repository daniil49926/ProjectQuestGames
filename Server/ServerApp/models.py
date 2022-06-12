from sqlalchemy import Column, String, Integer, Boolean

from database import Base


class Profiles(Base):
    __tablename__ = 'Profiles'
    id = Column('id', Integer, primary_key=True, index=True)
    user_name = Column('user_name', String, index=True, nullable=False)
    user_mail = Column('user_mail', String, index=True, nullable=False)
    user_password = Column('user_password', String, nullable=False)
    quest_1 = Column('quest_1', Integer, default=1)
    quest_2 = Column('quest_2', Integer, default=0)
    quest_3 = Column('quest_3', Integer, default=0)
    quest_4 = Column('quest_4', Integer, default=0)
    quest_5 = Column('quest_5', Integer, default=0)


class Quest(Base):
    __tablename__ = 'Quest'
    id = Column('id', Integer, primary_key=True, index=True)
    file_name = Column('file_name', String)
