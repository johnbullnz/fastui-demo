# FastUI Demo

Dev container to run the [FastUI](https://github.com/pydantic/FastUI) demo app.

## Running as dev container

Open the dev container in VS Code and run the following command in the terminal:

```bash
uvicorn fastui_demo:app --reload --reload-dir .
```

Navigate to [http://127.0.0.1:8000](http://127.0.0.1:8000).

## Building and running as Docker container

Build the Docker image:

```bash
docker build -t fastui-demo .
```

Run the Docker container:

```bash
docker run -it -p 8000:8000 --rm fastui-demo:latest
```

Navigate to [http://127.0.0.1:8000](http://127.0.0.1:8000).
