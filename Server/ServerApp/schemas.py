from pydantic import BaseModel


class BaseProfile(BaseModel):
    user_name: str
    user_mail: str
    user_password: str


class ProfileIn(BaseProfile):
    ...


class ProfileOut(BaseProfile):
    id: int
    quest_1: int
    quest_2: int
    quest_3: int
    quest_4: int
    quest_5: int

    class Config:
        orm_mode = True


class BaseQuest(BaseModel):
    file_name: str


class QuestIn(BaseQuest):
    ...


class QuestOut(BaseQuest):
    id: int

    class Config:
        orm_mode = True
