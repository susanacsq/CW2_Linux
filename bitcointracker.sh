#!/bin/bash

# Set the API endpoint URL
API_URL="https://api.coindesk.com/v1/bpi/currentprice.json"

# MySQL credentials
MYSQL_HOST="localhost"
MYSQL_USER="sysq"
MYSQL_PASSWORD="1234"
MYSQL_DATABASE="bitcointracker"

# Function to fetch and parse data from the API
fetch_data() {
    # Use curl to fetch the API response
    API_RESPONSE=$(curl -s "$API_URL")

    # Extract the current Bitcoin price in USD
    CURRENT_PRICE=$(echo "$API_RESPONSE" | jq '.bpi.USD.rate_float')

    # Extract the 24H low and high prices
    LOW_24H=$(echo "$API_RESPONSE" | jq '.bpi.USD.rate_float' | awk '{print $1 * 0.95}')
    HIGH_24H=$(echo "$API_RESPONSE" | jq '.bpi.USD.rate_float' | awk '{print $1 * 1.05}')

    insert_data "$CURRENT_PRICE" "$LOW_24H" "$HIGH_24H"
}

# Function to insert data into the MySQL database
insert_data() {
    CURRENT_PRICE="$1"
    LOW_24H="$2"
    HIGH_24H="$3"

    # Connect to the MySQL database
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" <<EOF
INSERT INTO bitcoin_prices (current_price, low_24h, high_24h, timestamp)
VALUES ('$CURRENT_PRICE', '$LOW_24H', '$HIGH_24H', CURRENT_TIMESTAMP());
EOF
}

# Function to handle errors
handle_error() {
    echo "Error: $1" >> "error.log"
}

# Trap any errors and call the handle_error function
trap 'handle_error $LINENO' ERR

# Call the fetch_data function
fetch_data

