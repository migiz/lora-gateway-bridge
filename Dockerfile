FROM golang:1.6.2

ENV PROJECT_PATH=/go/src/github.com/migiz/lora-gateway-bridge
ENV PATH=$PATH:$PROJECT_PATH/build

# install tools
RUN go get github.com/golang/lint/golint
RUN go get github.com/kisielk/errcheck

# setup work directory
RUN mkdir -p $PROJECT_PATH
WORKDIR $PROJECT_PATH

# copy source code
COPY . $PROJECT_PATH

# build
RUN make build

CMD ["lora-gateway-bridge"]
