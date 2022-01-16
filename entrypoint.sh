if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for db..."

    # shellcheck disable=SC2086
    while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
      sleep 0.1
    done

    echo "[db] PostgreSQL started"
fi

pipenv run python manage.py flush --no-input
pipenv run python manage.py migrate

exec "$@"