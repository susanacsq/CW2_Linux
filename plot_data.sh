#!/bin/bash

# MySQL connection details
MYSQL_HOST="localhost"
MYSQL_USER="your_mysql_username"
MYSQL_PASSWORD="your_mysql_password"
MYSQL_DB="bitcoin_price_tracker"

# Function to plot Bitcoin price changes
plot_bitcoin_price_changes() {
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" <<EOF
SELECT PriceDate, CurrentPriceUSD FROM PriceHistorical WHERE CryptoID = 1 ORDER BY PriceDate;
EOF | gnuplot -p -e "
    set title 'Bitcoin Price Changes';
    set xlabel 'Date';
    set ylabel 'Price (USD)';
    set xdata time;
    set timefmt '%Y-%m-%d';
    set format x '%Y-%m-%d';
    plot '-' using 1:2 with lines;
" > bitcoin_price_changes.png
}

# Function to plot other cryptocurrency rate changes (e.g., Ethereum)
plot_other_crypto_changes() {
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" <<EOF
SELECT PriceDate, CurrentPrice FROM PriceHistorical WHERE CryptoID = 2 ORDER BY PriceDate;
EOF | gnuplot -p -e "
    set title 'Ethereum Price Changes';
    set xlabel 'Date';
    set ylabel 'Price (ETH)';
    set xdata time;
    set timefmt '%Y-%m-%d';
    set format x '%Y-%m-%d';
    plot '-' using 1:2 with lines;
" > ethereum_price_changes.png
}

# Function to plot Bitcoin 24H price range
plot_bitcoin_24h_range() {
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" <<EOF
SELECT PriceDate, LowestPrice, HighestPrice FROM PriceHistorical WHERE CryptoID = 1 ORDER BY PriceDate;
EOF | gnuplot -p -e "
    set title 'Bitcoin 24H Price Range';
    set xlabel 'Date';
    set ylabel 'Price (USD)';
    set xdata time;
    set timefmt '%Y-%m-%d';
    set format x '%Y-%m-%d';
    plot '-' using 1:2 with lines title 'Lowest', '-' using 1:3 with lines title 'Highest';
" > bitcoin_24h_range.png
}

# Function to plot multiple cryptocurrency rates
plot_multiple_crypto_rates() {
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" <<EOF
SELECT c.CryptoName, p.PriceDate, p.CurrentPriceUSD
FROM Cryptocurrencies c
JOIN PriceHistorical p ON c.CryptoID = p.CryptoID
ORDER BY p.PriceDate, c.CryptoName;
EOF | gnuplot -p -e "
    set title 'Cryptocurrency Rates';
    set xlabel 'Date';
    set ylabel 'Price (USD)';
    set xdata time;
    set timefmt '%Y-%m-%d';
    set format x '%Y-%m-%d';
    plot '-' using 1:3 with lines title columnheader;
" > crypto_rates.png
}

# Add more plotting functions here

# Example usage
plot_bitcoin_price_changes
plot_other_crypto_changes
plot_bitcoin_24h_range
plot_multiple_crypto_rates