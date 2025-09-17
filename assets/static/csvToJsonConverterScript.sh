#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_csv_file> <output_json_file>"
    exit 1
fi

# Input CSV file from the first argument
input_file="$1"

# Output JSON file from the second argument
output_file="$2"

# Start of JSON output
echo "{" > "$output_file"
echo '    "users": [' >> "$output_file"

# Read each line of the CSV file and process it
first_line=true
awk -F',' 'NR > 1 { print $0 }' "$input_file" | while IFS=',' read -r username firstName lastName email password temporary require_idp_link realmRoles groups; do
    echo "Converting $username..."
    if [ "$first_line" = true ]; then
        first_line=false
    else
        echo '        },' >> "$output_file"
    fi
    
    # Start of user entry
    echo '        {' >> "$output_file"
    
    # User attributes
    echo '            "username": "'"$username"'",' >> "$output_file"
    echo '            "enabled": true,' >> "$output_file"
    echo '            "firstName": "'"$firstName"'",' >> "$output_file"
    echo '            "lastName": "'"$lastName"'",' >> "$output_file"
    echo '            "email": "'"$email"'",' >> "$output_file"

    # Credentials array
    echo '            "credentials": [' >> "$output_file"
    echo '                {' >> "$output_file"
    echo '                    "type": "password",' >> "$output_file"
    echo '                    "value": "'"$password"'",' >> "$output_file"
    echo '                    "temporary": "'"$temporary"'"' >> "$output_file"
    echo '                }' >> "$output_file"
    echo '            ],' >> "$output_file"

    if [ "$require_idp_link" = true ]; then
        echo '            "requiredActions" : [ "idp_link" ],' >> "$output_file"
    fi

    # RealmRoles array
    echo '            "realmRoles": [' >> "$output_file"
    IFS=';' read -r -a realmRoles_array <<< "$realmRoles"
    for ((i=0; i<${#realmRoles_array[@]}; i++)); do
        if [ $i -eq $((${#realmRoles_array[@]}-1)) ]; then
            echo '                "'"${realmRoles_array[$i]}"'"' >> "$output_file"
        else
            echo '                "'"${realmRoles_array[$i]}"'",' >> "$output_file"
        fi
    done
    echo '            ],' >> "$output_file"

    # Groups array
    echo '            "groups": [' >> "$output_file"
    IFS=';' read -r -a groups_array <<< "$groups"
    for ((i=0; i<${#groups_array[@]}; i++)); do
        if [ $i -eq $((${#groups_array[@]}-1)) ]; then
            echo '                "'"${groups_array[$i]}"'"' >> "$output_file"
        else
            echo '                "'"${groups_array[$i]}"'",' >> "$output_file"
        fi
    done
    echo '            ]' >> "$output_file"
done

# Closing last user entry without trailing comma
echo '        }' >> "$output_file"

# End of JSON output
echo '    ]' >> "$output_file"
echo "}" >> "$output_file"

echo "Conversion complete. JSON file generated: $output_file"
