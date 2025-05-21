# rec0de

`rec0de` is a minimal Bash script for recursively scanning files with specific extensions, respecting an ignore file (such as `.gitignore`), and saving the results to a single output file.

Originally designed to **quickly gather relevant code or data files** for uploading into AI assistants or automated processing tools.

---

## ✨ Features

* Recursive file discovery from a specified entry point
* Custom file extensions filter (e.g. `.py`, `.json`, `.txt`, etc.)
* Depth control (`--level`)
* Ignores files and folders defined in `.gitignore` or any other ignore file
* Output collected filenames to a single text file

---

## Installation

```bash
bash install.sh
```

This installs the script to `~/.local/bin/rec0de` and creates a shell alias so you can call `rec0de` from anywhere.

---

## Usage

```bash
rec0de --ignore .gitignore \
       --out files.txt \
       --entry . \
       --level 3 \
       --ext py,json,txt
```

### Parameters

| Flag       | Description                                        |
| ---------- | -------------------------------------------------- |
| `--ignore` | Path to ignore file (e.g. `.gitignore`)            |
| `--out`    | Output file to save matching paths                 |
| `--entry`  | Root folder or file to start from                  |
| `--level`  | Max depth to scan subdirectories                   |
| `--ext`    | Comma-separated list of file extensions to include |

---

## Example

This will generate `files.txt` containing a list of all `.py`, `.json`, and `.txt` files in the current directory and its subfolders (up to 3 levels deep), excluding anything in `.gitignore`.

---

## License

MIT License. See `LICENSE` for details.
