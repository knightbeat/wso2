using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Communication.Tcp
{
    class TCPListener
    {
        public static void Main()
        {
            string ListenerIPAddress = "127.0.0.1";
            int ListenerPort = 500;
            try
            {
                IPAddress ipAddress = IPAddress.Parse(ListenerIPAddress);

                Console.WriteLine("Starting TCP listener...");

                TcpListener listener = new TcpListener(ipAddress, ListenerPort);

                listener.Start();

                while (true)
                {
                    Socket client = listener.AcceptSocket();
                    Console.WriteLine("Connection accepted.");

                    var childSocketThread = new Thread(() =>
                    {
                        byte[] data = new byte[100];
                        int size = client.Receive(data);
                        Console.WriteLine("Recieved data: ");
                        for (int i = 0; i < size; i++)
                            Console.Write(Convert.ToChar(data[i]));

                        Console.WriteLine();

                        client.Close();
                    });
                    childSocketThread.Start();
                }

                listener.Stop();
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.StackTrace);
                Console.ReadLine();
            }
        }
    }
}
