#!/bin/bash

IGNORE_FILE=""
OUTPUT_FILE="rec0de_output.txt"
ENTRY_POINT="."
MAX_DEPTH=5
EXTENSIONS=("py" "json")

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --ignore)
      IGNORE_FILE="$2"
      shift; shift
      ;;
    --out)
      OUTPUT_FILE="$2"
      shift; shift
      ;;
    --entry)
      ENTRY_POINT="$2"
      shift; shift
      ;;
    --level)
      MAX_DEPTH="$2"
      shift; shift
      ;;
    --ext)
      IFS=',' read -ra EXTENSIONS <<< "$2"
      shift; shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

if ! command -v rg &> /dev/null; then
  echo "ripgrep (rg) is required. Please install it."
  exit 1
fi

EXT_FILTER_REGEX=""
for ext in "${EXTENSIONS[@]}"; do
  EXT_FILTER_REGEX+="\\.${ext}\$|"
done
EXT_FILTER_REGEX="${EXT_FILTER_REGEX%|}"

IGNORE_OPTS=()
if [[ -n "$IGNORE_FILE" ]]; then
  IGNORE_OPTS+=(--ignore-file "$IGNORE_FILE")
fi

clear
echo "🔍 Scanning: $ENTRY_POINT (depth=$MAX_DEPTH)"
echo "📁 Ignore file: ${IGNORE_FILE:-none}"
echo "📄 Output: $OUTPUT_FILE"
echo "🔎 Extensions: ${EXTENSIONS[*]}"

if [[ -f "$ENTRY_POINT" ]]; then
  echo "$ENTRY_POINT" | rg -E "$EXT_FILTER_REGEX" > "$OUTPUT_FILE"
elif [[ -d "$ENTRY_POINT" ]]; then
  rg --files "$ENTRY_POINT" \
     --maxdepth "$MAX_DEPTH" \
     "${IGNORE_OPTS[@]}" \
     | rg -E "$EXT_FILTER_REGEX" \
     > "$OUTPUT_FILE"
else
  echo "❌ Invalid entry point: $ENTRY_POINT"
  exit 1
fi

echo "✅ Done. Results saved to $OUTPUT_FILE"

