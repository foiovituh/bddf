# bddf ⛓️
Broken Dynamic Dependencies Finder.

## Requirements 🔗
<b>OS</b>:
- GNU/Linux or WSL

<b>Binaries</b>:
- ldd
- which

## Quick usage guide 📚
Only one command to check:<br>
```bash
./bddf.sh -u ls
```

Checks all commands in a text file:
```bash
./bddf.sh -d "/home/you/project/dependencies.txt"
```

## Do you want help me? 👥
If you have any ideas or wish to contribute to the project, contact me on Twitter @vituohto or send me a pull request! :)

## License 🏳️
```
MIT License

Copyright (c) 2023 Vitu Ohto

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
