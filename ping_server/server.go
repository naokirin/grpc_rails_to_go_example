package main

import (
	"context"
	"log"
	"net"
	"strconv"
	"time"

	ping "github.com/naokirin/grpc_ping_server/proto"
	"google.golang.org/grpc"
)

type server struct{}

func main() {
	listener, err := net.Listen("tcp", ":5300")
	if err != nil {
		log.Fatalf("Failed to listen: %v\n", err)
		return
	}
	grpcSrv := grpc.NewServer()
	svr := server{}
	ping.RegisterPingServiceServer(grpcSrv, &svr)
	log.Printf("Ping service is running!")
	grpcSrv.Serve(listener)
}

// pongを返す
func (s *server) Ping(ctx context.Context, req *ping.Empty) (*ping.Pong, error) {
	return &ping.Pong{Text: "pong"}, nil
}

// 指定回数、streamでpongを返す
func (s *server) PingStream(req *ping.PingRequest, stream ping.PingService_PingStreamServer) error {
	count := req.GetCount()
	for i := int32(0); i < count; i++ {
		pong := &ping.Pong{
			Text: "pong" + strconv.Itoa(int(i)),
		}
		stream.Send(pong)
		time.Sleep(100 * time.Millisecond)
	}
	return nil
}
