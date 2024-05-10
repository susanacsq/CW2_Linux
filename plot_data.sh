#!/bin/bash

# MySQL connection details
MYSQL_HOST="localhost"
MYSQL_USER="sysq"
MYSQL_PASSWORD="1234"
MYSQL_DATABASE="bitcointracker"

# Function to plot Bitcoin price changes
plot_bitcoin_price_changes() {
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" <<EOF | tail -n +2 > bitcoin_prices.dat
SELECT timestamp, current_price FROM bitcoin_prices ORDER BY timestamp;
EOF
    gnuplot -p -e "
    set title 'Bitcoin Price Changes';
    set xlabel 'Date';
    set ylabel 'Price (BTC)';
    set xdata time;
    set timefmt '%Y-%m-%d';
    set format x '%Y-%m-%d';
    plot 'bitcoin_prices.dat' using 1:2 with lines;
" > bitcoin_price_changes.png
}

# Call the function to plot Bitcoin price changes
plot_bitcoin_price_changes
