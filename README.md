# ActionCableSample
This is a sample project of a chat application with Ruby on Rails 5 Action Cable and its Swift 3 client app.

The Rails part is based on the code below.

- [JunichiIto/campfire](https://github.com/JunichiIto/campfire)

The Swift client app uses `Swift-ActionCableClient`.

- [danielrhodes/Swift-ActionCableClient](https://github.com/danielrhodes/Swift-ActionCableClient)


## Installation

Install `Swift-ActionCableClient` via CocoaPods.

```
$ cd iOS/ActionCableSample
$ pod install
```

## Launch App

Start rails server.

```
$ cd ../../Rails/action-cable-sample
$ rails server
```


Then, open `ActionCableSample.xcworkspace` and run the app on iOS simulator.


## License

MIT License.