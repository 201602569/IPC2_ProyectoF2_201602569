using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class timeline : System.Web.UI.Page
{
    DateTime date;
    string html = "";
    Random rnd = new Random();

    protected void Page_Load(object sender, EventArgs e)
    {
        date = DateTime.Now;
        for (int i = 0; i < rnd.Next(30); i++) {
            int j = rnd.Next(3);
            switch (j)
            {
                case 0:
                    html += Estado(date, "201602569", "publicacion ");
                    break;
                case 1:
                    html += Asociacion(date, "ejemplo1", "Proyecto 1, generar codigo a bajo nivel para ejecutar el algoritmo que se requiere el siguiente programa");
                    break;
                case 2:
                    html += Tarea_Proyecto(date, "Pagina", "Desarrollar pagina web aplicada a los siguientes procesos");
                    break;
            default:
            html += "";
                    break;
            }
        }
        this.briks.InnerHtml = html;
    }

    private string Tarea_Proyecto(DateTime fecha, string titulo, string descripcion) {
        string html = "\n";
        html += "<article class=\"brick entry format-standard animate-this\">" + "\n";
        html += "   <div class=\"entry-thumb\">" + "\n";
        html += "       <a href=\"single-standard.html\" class=\"thumb-link\">" + "\n";
        html += "           <img src=\"img/types/proyecto.png\" alt=\"building\"/>" + "\n";
        html += "       </a>" + "\n";
        html += "   </div>" + "\n";
        html += "   <div class=\"entry-text\">" + "\n";
        html += "       <div class=\"entry-header\">" + "\n";
        html += "           <div class=\"entry-meta\">" + "\n";
        html += "               <span class=\"cat-links\">" + "\n";
        html += "                   <h7>" + fecha.Day.ToString() + "/" + fecha.Month.ToString() + "/" + fecha.Year.ToString() + "</h7>" + "\n";
        html += "                   <h7> - </h7>" + "\n";
        html += "                   <h7>" + fecha.Hour.ToString() + ":" + fecha.Minute.ToString() + ":" + fecha.Second.ToString() + "</h7>" + "\n";
        html += "               </span> " + "\n";
        html += "               <h1 class=\"entry-title\"><a href = \"single-standard.html\"> " + titulo + " </a></h1>" + "\n";
        html += "           </div>" + "\n";
        html += "           <div class=\"entry-excerpt\">" + "\n";
        html += "               " + descripcion + "\n";
        html += "           </div> " + "\n";
        html += "       </div>" + "\n";
        html += "   </article>" + "\n\n";
        return html;
    }

    private string Estado(DateTime fecha, string autor, string descripcion)
    {
        string html = "\n";
        html += "<article class=\"brick entry animate-this\">" + "\n";
        html += "   <div class=\"entry-thumb\">" + "\n";
        html += "       <a class=\"thumb-link\">" + "\n";
        html += "             <img src=\"img/types/estado.png\" alt=\"building\">" + "\n";
        html += "       </a>" + "\n";
        html += "   </div>" + "\n";
        html += "   <div class=\"entry-text\">" + "\n";
        html += "       <div class=\"entry-header\">" + "\n";
        html += "           <div class=\"entry-meta\">" + "\n";
        html += "               <span class=\"cat-links\">" + "\n";
        html += "                   <h7>" + fecha.Day.ToString() + "/" + fecha.Month.ToString() + "/" + fecha.Year.ToString() + "</h7>" + "\n";
        html += "                   <h7> - </h7>" + "\n";
        html += "                   <h7>" + fecha.Hour.ToString() + ":" + fecha.Minute.ToString() + ":" + fecha.Second.ToString() + "</h7>" + "\n";
        html += "               </span> " + "\n";
        html += "           </div>" + "\n";
        html += "       </div>" + "\n";
        html += "       <div class=\"entry-thumb\">" + "\n";
        html += "           <blockquote>" + "\n";
        html += "               <p>" + descripcion + "</p>" + "\n";
        html += "               <cite>" + autor + "</cite>" + "\n";
        html += "           </blockquote>" + "\n";
        html += "       </div>" + "\n";
        html += "   </div>" + "\n";
        html += "</article>" + "\n";
        return html;
    }

    private string Asociacion(DateTime fecha, string titulo, string descripcion)
    {
        string html = "\n";
        html += "   <article class=\"brick entry format-standard animate-this\"> " + "\n";
        html += "       <div class=\"entry-thumb\">" + "\n";
        html += "           <a href = \"single-standard.html\" class=\"thumb-link\">" + "\n";
        html += "               <img src = \"img/types/asociacion.png\" alt=\"building\">" + "\n";
        html += "           </a>" + "\n";
        html += "       </div> " + "\n";
        html += "       <div class=\"entry-text\">" + "\n";
        html += "           <div class=\"entry-header\">" + "\n";
        html += "               <div class=\"entry-meta\">" + "\n";
        html += "                   <span class=\"cat-links\">" + "\n";
        html += "                       <h7>" + fecha.Day.ToString() +"/"+ fecha.Month.ToString() + "/" + fecha.Year.ToString() + "</h7>" + "\n";
        html += "                       <h7> - </h7>" + "\n";
        html += "                       <h7>" + fecha.Hour.ToString() + ":" + fecha.Minute.ToString() + ":" + fecha.Second.ToString() +"</h7>" + "\n";
        html += "                   </span> " + "\n";
        html += "               </div>" + "\n";
        html += "               <h1 class=\"entry-title\"><a href = \"single-standard.html\"> "+ titulo +" </a></h1>" + "\n";
        html += "           </div>" + "\n";
        html += "           <div class=\"entry-excerpt\">" + "\n";
        html += "               " + descripcion + "\n";
        html += "           </div> " + "\n";
        html += "       </div>" + "\n";
        html += "   </article>" + "\n\n";
        return html;
    }

    private void logOut() {
        Session.Clear();
    }
}