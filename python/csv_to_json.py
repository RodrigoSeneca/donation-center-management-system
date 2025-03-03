# CSV to JSON Converter
# Author: Rodrigo Murilo Barros
# Date: February 2025
#
# Purpose: This script converts checkout data from CSV format to JSON format
# as part of the Donation Center Management System data pipeline.
# 
# The conversion to JSON is necessary for:
# 1. Better data interchange between systems
# 2. Preparing data for import into MySQL database
# 3. Compatibility with web-based visualization tools
# 4. Preserving data structure while allowing for data modifications

import pandas as pd
import json

# Read checkout data from CSV
df = pd.read_csv('check_out.csv', encoding='utf-8')

# Convert to JSON (compact format)
json_data = df.to_json(orient='records')

# Save compact version
with open('check_out.json', 'w', encoding='utf-8') as f:
    f.write(json_data)

# Save pretty-formatted version with indentation
with open('output_pretty_check_out.json', 'w', encoding='utf-8') as f:
    json_object = json.loads(json_data)
    json.dump(json_object, f, indent=4, ensure_ascii=False)

print("Conversion completed!")
