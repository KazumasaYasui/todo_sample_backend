FROM minio/minio:latest

COPY ./policy.json ./entrypoint.sh /opt/

RUN chmod 755 /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD ["server", "/data"]
