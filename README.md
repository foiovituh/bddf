# ⛓️ bddf (broken dynamic dependencies finder)
![GitHub License](https://img.shields.io/github/license/foiovituh/bddf)
![GitHub Release](https://img.shields.io/github/v/release/foiovituh/bddf)

🧩 A simple Bash script to check system commands for missing shared libraries (.so files) with ldd.

## 🔗 Dependencies
Requires basic Unix tools:
- `bash`
- `cut`
- `grep`
- `ldd`
- `which`

These are available by default on most Linux systems, but may be missing in minimal environments (e.g. Alpine, Docker).

## 📦 Installation
```bash
git clone https://github.com/foiovituh/bddf.git
cd bddf
chmod +x bddf.sh
sudo ln -s "$PWD/bddf.sh" /usr/local/bin/bddf
```

## 🚀 Usage
### Command syntax :
```bash
bddf.sh [type of search] [binary name or dependencies file path]
```

### Type of search:
```bash
-b <binary_name>          binary name to check
-d <dependencies_file>    file that contains a list of binaries to check
```

### Optional:
```bash
-v                        show script version
-h                        show a help message
```

### Examples:
- Only one binary to check:
```bash
bddf.sh -b compton
```

- Check multiple binaries from a file:
```bash
# Example content of dependencies.txt:
# jq
# figlet
# compton

bddf.sh -d /home/user/project/dependencies.txt
```

## ⭐ Support the Project
If you like this project or find it useful, please give it a star! It helps with visibility and motivates continued development.

## 📄 License
Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.
