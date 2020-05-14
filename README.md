# ElixirYoutubeDl
Elixir wrapper for [youtube-dl](http://rg3.github.io/youtube-dl/).

## Intro
ElixirYoutubeDl already includes the latest version of youtube-dl, in case you don't have youtube-dl installed.

There are a few arguments such as `--extract-audio` which require `ffmpeg` or `avconf` to be installed, if this is the case ElixirYoutubeDl will instruct you to do so.

## Usage
All options available to youtube-dl can be passed as as keywords lists:

```
options = ["extract-audio", "audio-format": "mp3"]
ElixirYoutubeDl.Download.download("https://www.youtube.com/watch?v=dQw4w9WgXcQ", options)
```

## Contributing
1. Fork the repo
2. Create your feature branch (`git checkout -b feature/branch`)
3. Commit your changes (`git commit -am Added feature x`)
4. Push to the branch (`git push origin feature/branch`)
5. Create a new Pull Request

## Todo
- CI
- GenServer
- Filter invalid arguments
- Update youtube-dl binary
- Specs

