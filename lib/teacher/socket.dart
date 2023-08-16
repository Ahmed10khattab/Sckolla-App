import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
 IO.Socket ?socket;
  
    socket=IO.io('https://joker.animeraa.com/',{'transports':['websocket'],"autoConnect":false});
  socket.connect();
  socket.onConnect((data) {
 print('clint is connected with server!' );
  });
  socket.onDisconnect((data) {
     print('clint is disconnected');
  },);

  socket.emit("msg","hello my name ahmed");
  socket.on('res',((data) {
    // setState(() {
    //    msgs.add(data);

    // });
  }));
   
  

}