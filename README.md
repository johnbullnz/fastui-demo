# FastUI App Template

## Running as Dev container

Open the dev container in VS Code and run the following command in the terminal:

```bash
uvicorn fastui_app:app --reload --reload-dir .
```

Navigate to [http://127.0.0.1:8000](http://127.0.0.1:8000).

## Running in Docker container

Build the Docker image:

```bash
docker build -t fastui-app .
```

Run the Docker container:

```bash
docker run -it -p 8000:8000 --rm fastui-app:latest
```
Navigate to [http://127.0.0.1:8000](http://127.0.0.1:8000).
