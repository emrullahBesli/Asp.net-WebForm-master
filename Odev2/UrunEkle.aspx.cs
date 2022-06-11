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
    public partial class UrunEkle : System.Web.UI.Page
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
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            UrunEkle1();
            UrunGetir();
        }
        public void UrunEkle1()
        {
            Connection2 con = new Connection2();
            DataTable tablo = new DataTable();
            con.con.Open();
            con.komut = new SqlCommand("spUrunEkle", con.con);
            con.komut.CommandType = CommandType.StoredProcedure;    
            con.komut.Parameters.AddWithValue("@UrunAd", txtUrunAd.Text);
            con.komut.Parameters.AddWithValue("@UrunAciklama", txtUrunAciklama.Text);
            con.komut.ExecuteNonQuery();
            con.con.Close();
        }
        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            UrunGuncelle();
            UrunGetir();
        }
        public void UrunGuncelle()
        {
            Connection2 con = new Connection2();
            DataTable tablo = new DataTable();
            con.con.Open();
            con.komut = new SqlCommand("spUrunGuncelle", con.con);
            con.komut.CommandType = CommandType.StoredProcedure;
            con.komut.Parameters.AddWithValue("@UrunID", txtUrunID.Text);
            con.komut.Parameters.AddWithValue("@UrunAd", txtUrunAd.Text);
            con.komut.Parameters.AddWithValue("@UrunAciklama", txtUrunAciklama.Text);
            con.komut.ExecuteNonQuery();
            con.con.Close();
        }
    }

}