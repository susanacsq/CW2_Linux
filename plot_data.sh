#!/bin/bash

MYSQL_HOST="localhost"
MYSQL_USER="sysq"
MYSQL_PASSWORD="1234"
MYSQL_DATABASE="bitcointracker"

plot_bitcoin_price_changes() {
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE>
SELECT timestamp, current_price FROM bitcoin_prices ORDER BY timestamp;
EOF
    gnuplot -p -e "
    set title 'Bitcoin Price Changes';
    set xlabel 'Date';
    set ylabel 'Rates (USD)';
    set xdata time;
    set timefmt '%Y-%m-%d';
    set format x '%Y-%m-%d';
    plot 'bitcoin_prices.dat' using 1:3 with lines;
"
}

plot_bitcoin_price_changes



