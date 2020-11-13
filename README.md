# Hoop

An NBA sporting app built with flutter(Googles UI framework) and the NBA-API.


## Requirements
Note: Its important to get your API Key, the below steps explain how you can acheive this. Always take care to keeping your Api keys a secret.

- log on to https://rapidapi.com/ and register an account if you don't have one.
- After registering your account, go to the Api marketplace and subscribe to the Api-NBA @ https://rapidapi.com/api-sports/api/api-nba
- Select a free plan which allows you to make a 100 calls per day.
- Once subscribed to the Api on a free plan, get your API key.
- Now Navigate to this file path on this project repo i.e lib/services/apikey
- create a new dart file called "key.dart"
- paste below code in the dart file:

```
class NbaApi {
  static final key = "YOUR-API-KEY-GOES-HERE";
}
```

- Save the file, you should now be able to run the app on your device.

## Screenshots

![hoop image1](https://github.com/ngbede/hoop/blob/master/screenshot/screenshot1.png?raw=false)
![hoop image2](https://github.com/ngbede/hoop/blob/master/screenshot/screenshot2.png?raw=false)
![hoop image3](https://github.com/ngbede/hoop/blob/master/screenshot/screenshot3_0.png?raw=false)
![hoop image4](https://github.com/ngbede/hoop/blob/master/screenshot/screenshot4.png?raw=false)
![hoop image5](https://github.com/ngbede/hoop/blob/master/screenshot/screenshot5.png?raw=false)