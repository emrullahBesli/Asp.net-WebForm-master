using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Odev2
{
    public partial class KargoFirmaGoster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KargoGetir();
            }
        }
        public void KargoGetir()
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spKargoFirmaGetir", con);
            con.Open();
            rptKargo.DataSource = cmd.ExecuteReader();
            rptKargo.DataBind();
            con.Close();
        }
    }
}