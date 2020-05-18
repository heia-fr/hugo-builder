FROM golang:latest AS builder
# RUN GO111MODULE=on go get -v -tags extended github.com/gohugoio/hugo
RUN git clone https://github.com/gohugoio/hugo.git
RUN cd hugo; go install --tags extended

FROM node:latest  
COPY --from=builder /go/bin/hugo /usr/local/bin/hugo
RUN npm install -g postcss-cli
RUN npm install -g autoprefixer
ENTRYPOINT [ "/usr/local/bin/hugo" ]
