# rec0de

`rec0de` is a minimal Bash script for recursively scanning files with specific extensions, respecting an ignore file (like `.gitignore`), and saving the **full contents** of matching files into a single output file.

It is designed for **quick collection of code/data snippets** to upload into AI assistants or pipelines that need full file context.

---

## Features

* Recursive file discovery from a given entry point
* Supports custom file extensions (e.g. `.py`, `.json`, `.txt`, etc.)
* Depth control via `--level`
* Respects `.gitignore` or any custom ignore file
* Output format includes file path and contents:

```
=== ./path/to/file.py ===
<file contents>


=== ./another/file.json ===
<file contents>
```

---

## Installation

```bash
bash install.sh
```

This installs the script to `~/.local/bin/rec0de` and sets up a shell alias (`rec0de`) in your `.bashrc` or `.zshrc`.

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
| `--out`    | Output file to save path + contents                |
| `--entry`  | Root directory or single file to start from        |
| `--level`  | Max recursion depth                                |
| `--ext`    | Comma-separated list of file extensions to include |

---

## 📦 Example Output

```
=== ./rec0de.sh ===
#!/bin/bash
# ...


=== ./install.sh ===
#!/bin/bash
# ...
```

---

## License

MIT License. See `LICENSE` for details.
