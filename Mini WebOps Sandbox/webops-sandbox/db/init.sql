CREATE USER appuser WITH PASSWORD 'Password';
CREATE DATABASE appdb OWNER appuser;
GRANT ALL PRIVILEGES O DATABASE appdb TO appuser;

\c appdb
CREATE TABLE IF NOT EXISTS pings (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT now()
);