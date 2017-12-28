using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class profile : System.Web.UI.Page
{
    protected string nombre, username, mail;
    protected void Page_Load(object sender, EventArgs e)
    {
       /* String input;

        TcpClient tcpClient =
                new TcpClient("192.168.1.8", 16001);
        // send name to server
        byte[] buf;
        String varSend = "";
        varSend = "8;"+Session["Usuario"];
        //varSend = "5;1,6,hola user1";
        // append newline as server expects a line to be read
        Debug.WriteLine(varSend + "\n");
        buf = Encoding.UTF8.GetBytes(varSend + "\n");

        NetworkStream stream = tcpClient.GetStream();
        stream.Write(buf, 0, varSend.Length + 1);
        NetworkStream networkStream =
                tcpClient.GetStream();
        using (StreamReader streamReader =
                new StreamReader(networkStream))
        {
            input = streamReader.ReadToEnd();
        }
        username = input.Split(',')[5];
        nombre = input.Split(',')[1];
        mail = input.Split(',')[2];*/
    }

    protected void _register(object sender, EventArgs e) {
        Response.Redirect("timeline.aspx");
    }

    protected void _submmit(object sender, EventArgs e)
    {
        String input;

       TcpClient tcpClient =
               new TcpClient("127.0.0.1", 16001);
       // send name to server
       byte[] buf;
       String varSend = "";
       varSend = "9;" + Session["Usuario"].ToString() + "," +this.comment_.Text;
       //varSend = "5;1,6,hola user1";

       // append newline as server expects a line to be read
       Debug.WriteLine(varSend + "\n");
       buf = Encoding.UTF8.GetBytes(varSend + "\n");

       NetworkStream stream = tcpClient.GetStream();
       stream.Write(buf, 0, varSend.Length + 1);
       NetworkStream networkStream =
               tcpClient.GetStream();
       using (StreamReader streamReader =
               new StreamReader(networkStream))
       {
           input = streamReader.ReadToEnd();
       }
    }
}