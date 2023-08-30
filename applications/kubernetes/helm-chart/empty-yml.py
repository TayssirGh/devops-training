import os
import sys
import yaml

if len(sys.argv) != 2:
    print("Usage: python extract_keys.py <input_yaml_file>")
    sys.exit(1)

input_file = sys.argv[1]
output_file = os.path.splitext(input_file)[0] + "_keys.yaml"

try:
    with open(input_file, "r") as f:
        data = yaml.safe_load(f)
except FileNotFoundError:
    print(f"Input file not found: {input_file}")
    sys.exit(1)

def extract_keys(d):
    if isinstance(d, dict):
        return {key: extract_keys(value) for key, value in d.items()}
    else:
        return None

keys_data = extract_keys(data)

with open(output_file, "w") as f:
    yaml.dump(keys_data, f, default_flow_style=False)

print(f"Keys extracted and saved to: {output_file}")
