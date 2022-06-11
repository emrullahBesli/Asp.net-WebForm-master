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
    public partial class UrunGoster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UrunGetir();
            }
        }
        public void UrunGetir()
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spUrunGetir", con);
            con.Open();
            rptUrun.DataSource = cmd.ExecuteReader();
            rptUrun.DataBind();
            con.Close();
        }
    }
}