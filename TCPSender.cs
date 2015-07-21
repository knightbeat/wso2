using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.Net;
using System.Net.Sockets;

namespace Communication.Tcp
{
    class TCPSender
    {
        static void Main(string[] args)
        {
            string input = "Sample text comes form dot net TEXT VALUE";
            string IpAddressOfESB = "127.0.0.1";
            int TCPPortOfESB = 6061;

            IPEndPoint ip = new IPEndPoint(IPAddress.Parse(IpAddressOfESB), TCPPortOfESB);
            Socket server = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            try
            {
                server.Connect(ip);
                Console.WriteLine("Connected server.");
            }
            catch (SocketException e)
            {
                Console.WriteLine("Unable to connect to server.");
                return;
            }
            server.Send(Encoding.ASCII.GetBytes(input));
            server.Shutdown(SocketShutdown.Both);
            server.Close();
        }
    }
}
