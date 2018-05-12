FROM golang:1.10

WORKDIR /app

RUN go get -u github.com/golang/dep/...

RUN apt-get update && apt-get install -y zip && rm -rf /var/lib/apt/lists/*

ADD decredbuild.sh .
ADD fetch.sh .

CMD ./fetch.sh && \
		./decredbuild.sh $TAG
