package com.wso2.communication.tcpclient;

import java.io.*;
import java.net.*;

class TCPSender {

    String host = "127.0.0.1";
    int port = 500;
    //String host = "192.168.56.101";
    //int port = 6061;
    Socket socket = null;

    TCPSender(String _host, int _port) throws Exception {
        host = _host;
        port = _port;
        socket = new Socket(host, port);
    }

    TCPSender() throws Exception {
        socket = new Socket(host, port);
    }

    void SendToServer(String msg) throws Exception {
        PrintWriter outToServer = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
        outToServer.print(msg);
        outToServer.flush();
    }

    void close() throws IOException {
        socket.close();
    }
    
    public static void main(String args[]) throws Exception {
        TCPSender client = new TCPSender();
        String message = "Sample text comes from Java TEXT VALUE 02";
        client.SendToServer(message);
        client.close();
    }
}
