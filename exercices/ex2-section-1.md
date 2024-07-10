# Exercice 2, Section 1

under the [applications folder of this repo](../applications) you will find 3 directories. Each corresponds to a
particular application :

* `backend`: A Node.JS application that serves two REST APIs :
    * The first takes in data and saves it to a MongoDB database and calls the `qr` app in order to generate a QR code.
    * The second recovers all the previously generated QR codes. You will find a `.env.example` under the app root that
      contains all the environment variables to use.
* `qr`: A python/FastAPI app that generates QR codes and saves them either to the FS or into an S3, depending on the
  environment variable configurations. You will find a `.env.example` under the app root that contains all the
  environment variables to use.
* `website`: Angular website that allows the users to input a string that generates QR codes, and show the logs for the
  previously created QR codes. In order to configure the app, you need to add a config
  under`applications/website/src/assets/configs/app-config.json`. The general outline of the config file is
  under `applications/website/src/assets/configs/app-config.json.example`

You are to launch all the applications and do a test locally.