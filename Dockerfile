FROM minlag/mermaid-cli

USER root
RUN apk add font-montserrat font-roboto-mono

USER mermaidcli

WORKDIR /data
ENTRYPOINT ["/home/mermaidcli/node_modules/.bin/mmdc", "-p", "/puppeteer-config.json"]
CMD [ "--help" ]