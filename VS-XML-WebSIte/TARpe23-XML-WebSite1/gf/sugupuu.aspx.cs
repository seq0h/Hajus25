using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;

namespace xml_webapp.sugupuu_ylesanne
{
	public partial class sugupuu : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            XsltArgumentList p = new XsltArgumentList();
            p.AddParam("otsing", "", kast1.Text);
            if (int.TryParse(kast2.Text, out int _))
            {
                p.AddParam("pikkus", "", kast2.Text);
            }
            xml6.TransformArgumentList = p;
        }
	}
}