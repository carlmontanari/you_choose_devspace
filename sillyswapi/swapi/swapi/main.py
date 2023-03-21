"""swapi.main"""
import os

from fastapi import FastAPI

from tortoise.contrib.fastapi import register_tortoise

from .routes import people, planets

app = FastAPI(title="Hello, DevSpace and StarWars!")
app.include_router(people.router)
app.include_router(planets.router)

POSTGRES_USER = "postgres"
POSTGRES_PASS = "password"
POSTGRES_DB = "starwars"

NAMESPACE = os.getenv("NAMESPACE")
POSTGRES_HOST = f"sillyswapi-db.{NAMESPACE}.svc.cluster.local"

register_tortoise(
    app,
    db_url=f"postgres://{POSTGRES_USER}:{POSTGRES_PASS}@{POSTGRES_HOST}:5432/{POSTGRES_DB}",
    modules={"models": ["swapi.db.models"]},
    generate_schemas=False,
    add_exception_handlers=True,
)
