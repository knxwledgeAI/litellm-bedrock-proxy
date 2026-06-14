# Bakes your model config into the LiteLLM image so Render can run it directly.
FROM ghcr.io/berriai/litellm:main-stable

COPY litellm_config.yaml /app/config.yaml

# Render injects $PORT; LiteLLM must listen on it (shell form so $PORT expands).
ENTRYPOINT []
CMD ["sh", "-c", "litellm --config /app/config.yaml --host 0.0.0.0 --port ${PORT:-4000}"]
