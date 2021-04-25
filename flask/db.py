import time
import random
import logging
from argparse import ArgumentParser, RawTextHelpFormatter

import psycopg2
from psycopg2.errors import SerializationFailure

from decouple import config
import os

conn = psycopg2.connect(
    database=config("DATABASE_NAME"),
    user=config("DATABASE_USER"),
    password=config("DATABASE_PASSWORD"),
    port=config("DATABASE_PORT"),
    host=config("DATABASE_HOST")
)

def pushData(query):
    with conn.cursor() as cur:
        cur.execute(query)
        return True

def pullData(query):
    with conn.cursor() as cur:
        cur.execute(query)
        rows = cur.fetchall()
        conn.commit()
        return rows