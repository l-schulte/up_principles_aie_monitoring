# Uni Passau - AIE Exercise Monitoring Helper

Create and activate a virtual environment:

```
python3 -m venv .env
source .env/bin/activate
```

Install python dependencies:

```
pip install -r requirements.txt
```

Bootstrap OpenTelemetry:

```
opentelemetry-bootstrap -a install
```

Start the sample application:

```
opentelemetry-instrument \
    --service_name "your-group" \
    --exporter_otlp_protocol http/protobuf \
    --exporter_otlp_endpoint "your-url" \
    flask run -p 8080
```

___

Example from [OpenTelemetry Getting Started](https://opentelemetry.io/docs/instrumentation/python/getting-started/)