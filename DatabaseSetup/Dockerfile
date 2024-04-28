FROM mcr.microsoft.com/mssql-tools

WORKDIR /app

COPY entrypoint.sh .
COPY *.sql .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

