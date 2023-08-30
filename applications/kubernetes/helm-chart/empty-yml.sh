# #!/bin/bash

# if [ $# -ne 1 ]; then
#   echo "Usage: $0 <input_yaml_file>"
#   exit 1
# fi

# input_file="$1"
# output_file="${input_file%.yaml}_keys.yaml"

# if [ ! -f "$input_file" ]; then
#   echo "Input file not found: $input_file"
#   exit 1
# fi

# awk '/^[[:space:]]*[^[:space:]:]+:/ {print $1 ":"}' "$input_file" > "$output_file"

# echo "Keys extracted and saved to: $output_file"
#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_yaml_file>"
  exit 1
fi

input_file="$1"
output_file="${input_file%.yaml}_keys.yaml"

if [ ! -f "$input_file" ]; then
  echo "Input file not found: $input_file"
  exit 1
fi

awk '/^[[:space:]]*[^[:space:]:]+:/{print $1 }' "$input_file" > "$output_file"

echo "Keys extracted and saved to: $output_file"
