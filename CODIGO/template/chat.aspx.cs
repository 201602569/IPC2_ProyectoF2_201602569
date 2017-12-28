using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chat : System.Web.UI.Page
{
    DateTime date;
    string html = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 0; i < 15; i++) { 
            html += addChat("soto" + (i+1), date = DateTime.Now);
        }
        this.contactos.InnerHtml = html;
        this.messagesBox.InnerHtml = getConversation("");
        this.currentChat.Text = "soto";
    }
    protected string addChat(string name, DateTime date) {
        string html = "\n";
        html += "           <div class=\"row sideBar-body\">" + "\n";
        html += "                 <div class=\"col-sm-9 col-xs-9 sideBar-main\">" + "\n";
        html += "                       <div class=\"row\">" + "\n";
        html += "                           <div class=\"col-sm-8 col-xs-8 sideBar-name\">" + "\n";
        html += "                               <span class=\"name-meta\">" + name + "</span>" + "\n";
        html += "                           </div>" + "\n";
        html += "                           <div class=\"col-sm-4 col-xs-4 pull-right sideBar-time\">" + "\n";
        html += "                               <span class=\"time-meta pull-right\">" + date.Hour.ToString() + ":" + date.Minute.ToString() + "</span>" + "\n";
        html += "                           </div>" + "\n";
        html += "                       </div>" + "\n";
        html += "                 </div>" + "\n";
        html += "           </div>" + "\n";
        html += "\n";
        return html;
    }

    protected string senderMsg(string message, DateTime date) {
        string html = "\n";
        html += "           <div class=\"row message-body\">" + "\n";
        html += "               <div class=\"col-sm-12 message-main-sender\">" + "\n";
        html += "                   <div class=\"sender\">" + "\n";
        html += "                       <div class=\"message-text\">" + message + "</div>" + "\n";
        html += "                       <span class=\"message-time pull-right\">" + date.DayOfWeek.ToString() + "</span>" + "\n";
        html += "                   </div>" + "\n";
        html += "               </div>" + "\n";
        html += "           </div>" + "\n";
        html += "" + "\n";
        return html;
    }

    protected string reseiverMsg(string message, DateTime date)
    {
        string html = "\n";
        html += "           <div class=\"row message-body\">" + "\n";
        html += "               <div class=\"col-sm-12 message-main-receiver\">" + "\n";
        html += "                   <div class=\"receiver\">" + "\n";
        html += "                       <div class=\"message-text\">" + message + "</div>" + "\n";
        html += "                       <span class=\"message-time pull-right\">" + date.DayOfWeek.ToString() + "</span>" + "\n";
        html += "                   </div>" + "\n";
        html += "               </div>" + "\n";
        html += "           </div>" + "\n";
        html += "" + "\n";
        return html;
    }

    protected string getConversation(string id) {
        string html = "";
        html += senderMsg("hola!", DateTime.Now);
        html += reseiverMsg("prueba?", DateTime.Now);
        html += senderMsg("estas bien?", DateTime.Now);
        return html;
    }
}