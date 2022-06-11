using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Odev2
{
    public partial class KullaniciEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                KullaniciGetir();
            }
        }
        public void KullaniciGetir()
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spKullaniciGetir", con);
            con.Open();
            kullaniciGrid.DataSource = cmd.ExecuteReader();
            kullaniciGrid.DataBind();
            con.Close();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            OrdersEkle();
            txtKAd.Text = "";
            txtKSoyad.Text = "";
            txtKYas.Text = "";
            txtKAdres.Text = "";
            KullaniciGetir();
        }
        public void OrdersEkle()
        {
            Connection con = new Connection();
            DataTable tablo = new DataTable();
            con.con.Open();
            con.komut = new SqlCommand("spKullaniciEkle", con.con);
            con.komut.CommandType = CommandType.StoredProcedure;
            con.komut.Parameters.AddWithValue("@KAd", txtKAd.Text);
            con.komut.Parameters.AddWithValue("@KSoyad", txtKSoyad.Text);
            con.komut.Parameters.AddWithValue("@KYas", Convert.ToInt32(txtKYas.Text));
            con.komut.Parameters.AddWithValue("@KAdres", txtKAdres.Text);
            con.komut.ExecuteNonQuery();
            con.con.Close();
        }

        protected void kullaniciGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(kullaniciGrid.DataKeys[e.RowIndex].Value);
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";
            
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spKullaniciSil", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@KullaniciID",id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            KullaniciGetir();
        }

        protected void kullaniciGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            kullaniciGrid.EditIndex = e.NewEditIndex;
            KullaniciGetir();
        }

        protected void kullaniciGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            kullaniciGrid.EditIndex = -1;
            KullaniciGetir();
        }

        protected void kullaniciGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";

            SqlConnection con = new SqlConnection(cs);
            int id = Convert.ToInt32(kullaniciGrid.DataKeys[e.RowIndex].Value);
            string ad = (kullaniciGrid.Rows[e.RowIndex].FindControl("txtAd") as TextBox).Text;
            string soyad = (kullaniciGrid.Rows[e.RowIndex].FindControl("txtSoyad") as TextBox).Text;
            int yas = Convert.ToInt32((kullaniciGrid.Rows[e.RowIndex].FindControl("txtYas") as TextBox).Text);
            string adres = (kullaniciGrid.Rows[e.RowIndex].FindControl("txtAdres") as TextBox).Text;
            SqlCommand cmd = new SqlCommand("spKullaniciGuncelle", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
           
            cmd.Parameters.AddWithValue("@KAd", ad);
            cmd.Parameters.AddWithValue("@KSoyad", soyad);
            cmd.Parameters.AddWithValue("@KYas", yas);
            cmd.Parameters.AddWithValue("@KAdres", adres);
            cmd.Parameters.AddWithValue("@KullaniciID", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            KullaniciGetir();
            
        }

       
    }
    public class Connection
    {
        public SqlConnection con = new SqlConnection("server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True");
        public SqlDataAdapter adtr { get; set; }
        public SqlCommand komut { get; set; }

    }
}