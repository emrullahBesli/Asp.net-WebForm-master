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
    public partial class KargoFirmaEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KargoFirmaGetir();
            }
            
        }
        public void KargoFirmaGetir()
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spKargoFirmaGetir", con);
            con.Open();
            KargoFirmaGrid.DataSource = cmd.ExecuteReader();
            KargoFirmaGrid.DataBind();
            con.Close();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            KargoFirmaEkle1();
            txtKargoAd.Text = "";
            txtKargoAdres.Text = "";
            KargoFirmaGetir();
        }
        public void KargoFirmaEkle1()
        {
            Connection1 con = new Connection1();
            DataTable tablo = new DataTable();
            con.con.Open();
            con.komut = new SqlCommand("spKargoFirmaEkle", con.con);
            con.komut.CommandType = CommandType.StoredProcedure;
            con.komut.Parameters.AddWithValue("@KargoFirmaAd", txtKargoAd.Text);
            con.komut.Parameters.AddWithValue("@Adres", txtKargoAdres.Text);
            con.komut.ExecuteNonQuery();
            con.con.Close();
        }
        protected void KargoFirmaGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(KargoFirmaGrid.DataKeys[e.RowIndex].Value);
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spKargoFirmaSil", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@KargoFirmaID", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            KargoFirmaGetir();
        }

        protected void KargoFirmaGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            KargoFirmaGrid.EditIndex = -1;
            KargoFirmaGetir();
        }

        protected void KargoFirmaGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            KargoFirmaGrid.EditIndex = e.NewEditIndex;
            KargoFirmaGetir();
        }

        protected void KargoFirmaGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cs = "server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True";

            SqlConnection con = new SqlConnection(cs);
            int id = Convert.ToInt32(KargoFirmaGrid.DataKeys[e.RowIndex].Value);
            string KargoFirmaAd = (KargoFirmaGrid.Rows[e.RowIndex].FindControl("txtKAd") as TextBox).Text;
            string KargoAdres = (KargoFirmaGrid.Rows[e.RowIndex].FindControl("txtKAdres") as TextBox).Text;
            SqlCommand cmd = new SqlCommand("spKargoFirmaGuncelle", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@KargoFirmaAd", KargoFirmaAd);
            cmd.Parameters.AddWithValue("@Adres", KargoAdres);
            cmd.Parameters.AddWithValue("@KargoFirmaID", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            KargoFirmaGetir();
        }
    }
    public class Connection1
    {
        public SqlConnection con = new SqlConnection("server=DESKTOP-JQLU36J;Database=c2cProje;Integrated Security=True");
        public SqlDataAdapter adtr { get; set; }
        public SqlCommand komut { get; set; }

    }
}