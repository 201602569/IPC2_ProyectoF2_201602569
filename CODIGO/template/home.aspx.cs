using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sign_In(object sender, EventArgs e)
    {
        String input;

        TcpClient tcpClient =
                new TcpClient("127.0.0.1", 16001);
        // send name to server
        byte[] buf;
        String varSend = "";
        varSend = "1;" + this.username.Text + "," + this.password.Text;
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
        if (!input.Equals("0"))
        {
            Session["Usuario"] = input;
            Response.Redirect("timeline.aspx");
        }
        else
        {
            Response.Redirect("home.aspx");
        }
    }
}