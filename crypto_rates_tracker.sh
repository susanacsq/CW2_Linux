#!/bin/bash

# Set the API endpoint URL
API_URL="https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"

# MySQL credentials
MYSQL_HOST="localhost"
MYSQL_USER="sysq"
MYSQL_PASSWORD="1234"
MYSQL_DATABASE="bitcointracker"

# Function to fetch and parse data from the CoinGecko API
fetch_data() {
    # Use curl to fetch the CoinGecko API response
    API_RESPONSE=$(curl -s "$API_URL")

    # Check if the API response was successful
    if [ $? -eq 0 ]; then
        # Extract data for the first five cryptocurrencies
        for ((i=0; i<5; i++)); do
            # Extract cryptocurrency name, symbol, and current price
            CRYPTO_NAME=$(echo "$API_RESPONSE" | jq -r ".[$i].name")
            CRYPTO_SYMBOL=$(echo "$API_RESPONSE" | jq -r ".[$i].symbol")
            CURRENT_PRICE=$(echo "$API_RESPONSE" | jq -r ".[$i].current_price")

            # Insert data into the MySQL database
            insert_data "$CRYPTO_NAME" "$CRYPTO_SYMBOL" "$CURRENT_PRICE"
        done
    else
        handle_error "Failed to fetch cryptocurrency data"
    fi
}

# Function to check if a record already exists in the database
check_record_exists() {
    CRYPTO_SYMBOL="$1"
    mysql -s -N -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM cryptocurrency_rates WHERE crypto_symbol='$CRYPTO_SYMBOL'" | grep -q "1"
}

# Function to insert data into the MySQL database
insert_data() {
    CRYPTO_NAME="$1"
    CRYPTO_SYMBOL="$2"
    CURRENT_PRICE="$3"

    # Check if the record already exists in the database
    if check_record_exists "$CRYPTO_SYMBOL"; then
        # Update existing record and log changes in historical table
        update_record "$CRYPTO_SYMBOL" "$CURRENT_PRICE"
    else
        # Insert new record
        insert_new_record "$CRYPTO_NAME" "$CRYPTO_SYMBOL" "$CURRENT_PRICE"
    fi
}

# Function to update existing record and log changes in historical table
update_record() {
CRYPTO_SYMBOL="$1"
    CURRENT_PRICE="$2"
    # Retrieve current price and timestamp from existing record
    PREVIOUS_PRICE=$(mysql -s -N -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SELECT current_price FROM cryptocurrency_rates WHERE crypto_symbol='$CRYPTO_SYMBOL'")
    PREVIOUS_TIMESTAMP=$(mysql -s -N -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SELECT timestamp FROM cryptocurrency_rates WHERE crypto_symbol='$CRYPTO_SYMBOL'")
    # Update existing record with new price and timestamp
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "UPDATE cryptocurrency_rates SET current_price='$CURRENT_PRICE', 
    timestamp=CURRENT_TIMESTAMP WHERE crypto_symbol='$CRYPTO_SYMBOL'"
    # Log changes in historical table
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "INSERT INTO cryptocurrency_rates_history (crypto_id, previous_price, previous_timestamp) SELECT id,
    '$PREVIOUS_PRICE', '$PREVIOUS_TIMESTAMP' FROM crypt>
}

# Function to insert new record into the MySQL database
insert_new_record() {
    CRYPTO_NAME="$1"
    CRYPTO_SYMBOL="$2"
    CURRENT_PRICE="$3"
    # Insert new record
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "INSERT INTO cryptocurrency_rates (crypto_name, crypto_symbol, current_price, timestamp)
    VALUES ('$CRYPTO_NAME', '$CRYPTO_SYMBOL', '$CURRENT_PRICE', CUR>
}

# Function to handle errors
handle_error() {
    echo "Error: $1" >> "error.log"
}

# Trap any errors and call the handle_error function
trap 'handle_error $LINENO' ERR

# Call the fetch_data function
fetch_data


