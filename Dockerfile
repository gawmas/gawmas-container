FROM postgres:15-alpine

# Set default environment variables
ENV POSTGRES_USER=${POSTGRES_SUPER_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_SUPER_PASSWORD}
ENV POSTGRES_DB=${POSTGRES_DB}

# Install required extensions
# RUN apt-get update && apt-get install -y postgresql-contrib
RUN apk add --no-cache postgresql-contrib


# pg_dump cmd ...
# docker exec pg-gawmas pg_dump -U postgres  gawmas > backup_dump

# Copy backup into container
COPY data-backup/full_backup.sql /docker-entrypoint-initdb.d
# COPY backup.sql /docker-entrypoint-initdb.d

# Example copy multiple files in "db-init" folder ...
# COPY db-init/*.sql /docker-entrypoint-initdb.d/