import logging
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class Event(BaseModel):
    key: str
    value: str
    userId: str
    timestamp: str


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str | None = None):
    return {"item_id": item_id, "q": q}


@app.post("/events")
def post_event(event: Event):
    logger.info(f"Received event: {event.model_dump()}")
    return {"status": "success", "message": "Event logged"}