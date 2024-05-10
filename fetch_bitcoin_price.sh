#!/bin/bash

# MySQL connection details
MYSQL_HOST="localhost"
MYSQL_USER="root"
MYSQL_PASSWORD="toor"
MYSQL_DB="bitcointracker"

# API URL for CoinDesk
API_URL="https://api.coindesk.com/v1/bpi/currentprice.json"

# Temporary file for storing API response
TEMP_FILE="/tmp/bitcoin_price_data.json"

# Function to insert data into the database
insert_data() {
    current_price=$(echo "$1" | jq '.bpi.USD.rate_float')
    lowest_price=$(echo "$1" | jq '.bpi.USD.rate_float' | awk '{print $1 * 0.95}')
    highest_price=$(echo "$1" | jq '.bpi.USD.rate_float' | awk '{print $1 * 1.05}')
    price_date=$(date +"%Y-%m-%d")

mysql -h "$MYSQL_HOST" -S "/var/run/mysqld/mysqld.sock" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" <<EOF
INSERT INTO PriceHistorical (CryptoID, PriceDate, CurrentPrice, LowestPrice, HighestPrice, CurrentPriceUSD)
VALUES (1, '$price_date', $current_price, $lowest_price, $highest_price, $current_price);
EOF
}

# Fetch Bitcoin price data from CoinDesk API
curl -s "$API_URL" -o "$TEMP_FILE"

# Check if the API response was successful
if [ $? -eq 0 ]; then
    # Parse the API response and insert data into the database
    insert_data "$(cat "$TEMP_FILE")"
    echo "Data inserted successfully."
else
    echo "Error: Failed to fetch Bitcoin price data."
fi

# Remove the temporary file
rm "$TEMP_FILE"
