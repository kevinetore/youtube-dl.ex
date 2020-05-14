# ElixirYoutubeDl
Elixir wrapper for [youtube-dl](http://rg3.github.io/youtube-dl/).

## Intro
ElixirYoutubeDl already includes the latest version of youtube-dl, in case you don't have youtube-dl installed.

There are a few arguments such as `--extract-audio` which require `ffmpeg` or `avconf` to be installed, if this is the case ElixirYoutubeDl will instruct you to do so.

## Usage

```
ElixirYoutubeDl.Download.download("https://www.youtube.com/watch?v=dQw4w9WgXcQ", ["--extract-audio", "--audio-format", "mp3"])
```

## Todo
- CI
- GenServer
- Filter invalid arguments
- Update youtube-dl binary
- Specs
