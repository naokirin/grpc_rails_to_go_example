package main

import (
    "context"
    "log"
    "net"
    "strconv"
    "time"

    "github.com/naokirin/grpc_pinger/proto"
    "google.golang.org/grpc"
)


type server struct{}

func main() {
    listener, err := net.Listen("tcp", ":5300")
    if err != nil {
        log.Fatalf("failed to listen: %v\n", err)
        return
    }
    grpcSrv := grpc.NewServer()
    svr := server{}
    pinger.RegisterPingerServer(grpcSrv, &svr)
    log.Printf("Pinger service is running!")
    grpcSrv.Serve(listener)
}

func (s *server) Ping(ctx context.Context, req *pinger.Empty) (*pinger.Pong, error) {
    pong := &pinger.Pong{
        Text: "pong",
    }
    return pong, nil
}

func (s *server) PingStream(req *pinger.PingRequest, stream pinger.Pinger_PingStreamServer) error {

    count := req.GetCount()
    for i := int32(0); i < count; i++ {
        pong := &pinger.Pong{
            Text: "pong" + strconv.Itoa(int(i)),
        }
        stream.Send(pong)
        time.Sleep(100 * time.Millisecond)
    }
    return nil
}
