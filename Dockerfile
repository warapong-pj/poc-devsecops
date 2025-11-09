FROM ghcr.io/astral-sh/uv:0.9.8-python3.13-alpine AS base

COPY pyproject.toml /home/appuser/pyproject.toml

RUN uv sync --no-dev

COPY ./app /app

EXPOSE 8000

CMD [ "fastapi", "run", "main.py" ]
