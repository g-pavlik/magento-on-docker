Work in progress

At this state of repo you have to do
much manually, to get started:

```
docker-compose up
./enter-container php
# in the container:
cd /var/www/n3_app
php -f install.php -- \
        --license_agreement_accepted yes \
        --locale en_GB --timezone "Europe/Paris" \
        --default_currency EUR \
        --db_host db --db_name n3_app --db_user root \
        --dp_pass root \
        --session_save db --url http://eset.docker.dev:8080 \
        --secure_base_url https://eset.docker.dev:8080 \
        --skip_url_validation yes --use_rewrites yes \
        --use_secure yes \--use_secure_admin yes \
        --admin_firstname Nexway --admin_lastname Nexway \
        --admin_email poland_backend@nexway.com \
        --admin_username nexway --admin_password nexway000

```
and if you're lucky - when you navigate to https://eset.docker.dev:8080/
You'll see error that it can't connect to redis server ;)