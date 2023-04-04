FROM python:3.11.2-slim-bullseye

RUN pip install --upgrade --root-user-action=ignore \
    pip ipython ipykernel
