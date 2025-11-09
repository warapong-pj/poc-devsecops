FROM ghcr.io/astral-sh/uv:0.9.8-python3.13-alpine AS base

RUN addgroup -S appuser && adduser -S appuser -G appuser

USER appuser
WORKDIR /home/appuser

COPY pyproject.toml /home/appuser/pyproject.toml

RUN uv sync --no-dev

COPY ./app /home/appuser/

EXPOSE 8000
ENV PATH=$PATH:/home/appuser/.venv/bin

CMD [ "fastapi", "run", "main.py" ]
