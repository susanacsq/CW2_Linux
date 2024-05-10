  GNU nano 5.4                                                                                                crypto_rates_tracker.sh                                                                                                         
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
        # Extract data for each cryptocurrency
        for ((i=0; i<$(echo "$API_RESPONSE" | jq length); i++)); do
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

# Function to insert data into the MySQL database
insert_data() {
    CRYPTO_NAME="$1"
    CRYPTO_SYMBOL="$2"
    CURRENT_PRICE="$3"

    # Connect to the MySQL database
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" <<EOF
INSERT INTO cryptocurrency_rates (crypto_name, crypto_symbol, current_price, timestamp)
VALUES ('$CRYPTO_NAME', '$CRYPTO_SYMBOL', '$CURRENT_PRICE', CURRENT_TIMESTAMP());
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
