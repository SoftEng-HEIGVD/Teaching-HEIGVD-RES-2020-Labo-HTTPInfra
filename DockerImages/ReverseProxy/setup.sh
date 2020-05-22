echo "Setting up RES lab..."
echo "Static app URL: $STATIC_APP"
echo "Dynamic app URL: $DYNAMIC_APP"

php /var/apache2/config-template.php > /etc/apache2/sites-available/001-reverse-proxy.conf

exec apache2-foreground