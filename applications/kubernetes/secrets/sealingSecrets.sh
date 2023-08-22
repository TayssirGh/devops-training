#! /bin/bash
chmod u+x ./applications/kubernetes/secrets/sealingSecrets.sh
input_folder="."
output_folder="./secrets/sealed-secrets"
seal_command="kubeseal -f"

for file_path in "$input_folder"/*.yml; do
    kind=$(grep -o 'kind: *.*' "$file_path" | cut -d ' ' -f 2)
    if [[ "$kind" == "Secret" ]]; then
        output_file="${output_folder}/sealed_$(basename "$file_path")"
        $seal_command "$file_path" -o yaml > "$output_file"
        echo "$file_path sealed to $output_file"
    fi
done
