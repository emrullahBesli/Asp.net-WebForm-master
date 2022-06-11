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
    public partial class Siparis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiparisGetir();
                KullaniciGetir();
                UrunGetir();
                KargoFirmaGetir();
            }
        }
        public void SiparisGetir()
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spTumTabloGetir", con);
            con.Open();
            rptSiparis.DataSource = cmd.ExecuteReader();
            rptSiparis.DataBind();
            con.Close();
        }
        public void SiparisEkle()
        {
            Connection2 con = new Connection2();
            DataTable tablo = new DataTable();
            con.con.Open();
            con.komut = new SqlCommand("spSiparisEkle", con.con);
            con.komut.CommandType = CommandType.StoredProcedure;
            con.komut.Parameters.AddWithValue("@KullaniciID", Convert.ToInt32(drpKullaniciID.SelectedValue));
            con.komut.Parameters.AddWithValue("@UrunID", Convert.ToInt32(drpUrunID.SelectedValue));
            con.komut.Parameters.AddWithValue("@KargoFirmaID", Convert.ToInt32(drpKargoFirmaID.SelectedValue));
            con.komut.ExecuteNonQuery();
            con.con.Close();
        }
        public void KullaniciGetir()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from Kullanici",
                @"server = DESKTOP-JQLU36J; Database = c2cProje; Integrated Security = True");
            DataTable dt = new DataTable();
            da.Fill(dt);
            drpKullaniciID.DataSource = dt;
            drpKullaniciID.DataValueField = "KullaniciID";
            drpKullaniciID.DataTextField = "KAd";
            drpKullaniciID.DataBind();
        }
        public void KargoFirmaGetir()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from KargoFirma",
                @"server = DESKTOP-JQLU36J; Database = c2cProje; Integrated Security = True");
            DataTable dt = new DataTable();
            da.Fill(dt);
            drpKargoFirmaID.DataSource = dt;
            drpKargoFirmaID.DataValueField = "KargoFirmaID";
            drpKargoFirmaID.DataTextField = "KargoFirmaAd";
            drpKargoFirmaID.DataBind();
        }
        public void UrunGetir()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from Urun",
                @"server = DESKTOP-JQLU36J; Database = c2cProje; Integrated Security = True");
            DataTable dt = new DataTable();
            da.Fill(dt);
            drpUrunID.DataSource = dt;
            drpUrunID.DataValueField = "UrunID";
            drpUrunID.DataTextField = "UrunAd";
            drpUrunID.DataBind();
        }
        public void SiparisGuncelle()
        {
            Connection2 con = new Connection2();
            DataTable tablo = new DataTable();
            con.con.Open();
            con.komut = new SqlCommand("spSiparisGuncelle", con.con);
            con.komut.CommandType = CommandType.StoredProcedure;
            con.komut.Parameters.AddWithValue("@SiparisID", Convert.ToInt32(txtSiparisID.Text));
            con.komut.Parameters.AddWithValue("@KullaniciID", Convert.ToInt32(drpKullaniciID.SelectedValue));
            con.komut.Parameters.AddWithValue("@UrunID", Convert.ToInt32(drpUrunID.SelectedValue));
            con.komut.Parameters.AddWithValue("@KargoFirmaID", Convert.ToInt32(drpKargoFirmaID.SelectedValue));
            con.komut.ExecuteNonQuery();
            con.con.Close();
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            SiparisEkle();
            SiparisGetir();
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            SiparisGuncelle();
            SiparisGetir();
        }
    }
    public class Connection2
    {
        public SqlConnection con = new SqlConnection("server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True");
        public SqlDataAdapter adtr { get; set; }
        public SqlCommand komut { get; set; }

    }
}
