from fastapi import FastAPI
from starlette.responses import StreamingResponse
from sqlalchemy.future import select
from typing import Dict, Any
import models
import schemas
import database
import json
import base64


app = FastAPI()


@app.on_event("startup")
async def shutdown():
    async with database.engine.begin() as conn:
        await conn.run_sync(models.Base.metadata.create_all)


@app.on_event("shutdown")
async def shutdown():
    await database.session.close()
    await database.engine.dispose()


@app.post('/add-quest-name/', response_model=schemas.QuestOut)
async def add_quest_name_in_db(quest: schemas.QuestIn) -> models.Quest:
    new_quest = models.Quest(**quest.dict())
    async with database.session.begin():
        database.session.add(new_quest)
    return new_quest


@app.get('/quest-name-by-id/{id_quest}/', response_model=schemas.QuestOut)
async def quest_name_in_db(id_quest) -> models.Quest:
    async with database.session.begin():
        quest = await database.session.execute(
            select(models.Quest).where(models.Quest.id == id_quest)
        )
    return quest.scalars().one_or_none()


@app.post('/register-new-profile/', response_model=schemas.ProfileOut)
async def register_new_profile(profile: schemas.ProfileIn) -> models.Profiles:
    new_user = models.Profiles(**profile.dict())
    async with database.session.begin():
        database.session.add(new_user)
    return new_user


@app.get('/profile/{user_name}/{user_password}', response_model=schemas.ProfileOut)
async def get_profile(user_name: str, user_password: str) -> models.Profiles:
    async with database.session.begin():
        profile = await database.session.execute(
            select(models.Profiles).where(
                models.Profiles.user_name == user_name,
                models.Profiles.user_password == user_password
            )
        )
    return profile.scalars().one_or_none()


@app.get('/lvl-up-profile/{user_name}/{user_password}/', response_model=schemas.ProfileOut)
async def lvl_up_profile(user_name: str, user_password: str) -> models.Profiles:
    async with database.session.begin():
        profile = await database.session.execute(
            select(models.Profiles).where(
                models.Profiles.user_name == user_name, models.Profiles.user_password == user_password
            )
        )
        pr = profile.scalars().one_or_none()
        if pr:
            if pr.quest_1 == 1:
                if pr.quest_2 == 1:
                    if pr.quest_3 == 1:
                        if pr.quest_4 == 1:
                            if pr.quest_5 == 1:
                                pass
                            else:
                                pr.quest_5 = 1
                        else:
                            pr.quest_4 = 1
                    else:
                        pr.quest_3 = 1
                else:
                    pr.quest_2 = 1
            await database.session.commit()
    return pr


@app.get('/quest_images/{quest_id}/')
async def get_quest_images(quest_id):
    async with database.session.begin():
        quest = await database.session.execute(
            select(models.Quest).where(models.Quest.id == quest_id)
        )
        res_quest = quest.scalars().one_or_none()
    if res_quest:
        _im_path = f'Quest_images/{res_quest.file_name}.png'

        def _iter_file():
            with open(_im_path, 'rb') as im:
                yield from im

        return StreamingResponse(_iter_file(), media_type="image/png")

    return None


@app.get('/quest_text/{quest_id}/')
async def get_quest_text(quest_id):
    async with database.session.begin():
        quest = await database.session.execute(
            select(models.Quest).where(models.Quest.id == quest_id)
        )
        res_quest = quest.scalars().one_or_none()

    if res_quest:
        _que_path = f'Quest_text/{res_quest.file_name}.json'

        with open(_que_path, 'r', encoding='Windows-1251') as jf:
            json_file = json.load(jf)

        return json_file
    return None
