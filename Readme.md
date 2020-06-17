# codeclimate-standardrb

CodeClimate Engine to run [standard](https://github.com/testdouble/standard), which is a

> 🌟 Ruby Style Guide, with linter & automatic code fixer.

To use this in your project, configure CodeClimate to run the `standardrb` engine. Eg, add this to `.codeclimate.yml`:

```yaml
plugins:
  standardrb:
    enabled: true
```

If you need to build the image, `make image` is your friend.

`make run` will run a container against `./code`, which has some good and bad example code in.

## Internals

CodeClimate requires engines ship as docker images, so that's what we build. The container runs `bin/codeclimate-standardrb` binary and mounts the code for us to examine at `/code` within the container.

Basically this engine wraps standard which in turn wraps rubocop to examine code and flag warnings/errors about it.

* `CodeclimateStandardrb::Runner` abstracts away us calling Standard from ruby, save us having to shell out to call it.
* `CodeclimateStandardrb::Formatter` is a Rubocop formatter, which receives each offense and then outputs it in the format CodeClimate requires to STDOUT

## License

```
Copyright 2020 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
