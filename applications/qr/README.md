# How to Launch the App

In order to launch the app, from under the app root, run the following command : 
```bash
pip install --no-cache-dir -r requirements.txt
uvicorn app:atom --host 0.0.0.0 --port "8420"
```