using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            this.BindGrid(GridView1, "Northwind", "SELECT  * from Customers");
            this.BindGrid(GridView2, "數據分析資料庫", "SELECT  * from 通訊軟體分析結果");
        }
       
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);
        this.BindGrid(GridView1, "Northwind" , "SELECT  * from Customers");
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.PageSize = Convert.ToInt32(DropDownList2.SelectedValue);
        this.BindGrid(GridView2, "數據分析資料庫", "SELECT  * from 通訊軟體分析結果");
    }
    private void BindGrid( GridView gridView , string dataBase , string comment)
    {
        
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //da.Fill(dt);

        SqlConnection Conn = new SqlConnection();       //宣告SQL的連線
        SqlCommand cmd = new SqlCommand();              //宣告對SQL執行的語法
        SqlDataAdapter da = new SqlDataAdapter();       //SQL 資料庫的連接與執行命令
        //DataSet ds = new DataSet();                     //宣告一個資料表存放在暫存記憶體內

        cmd.Connection = Conn;   //將SQL執行的命令語法程式CMD與CONN與SQL連接


        //設定連線IP位置、資料表，帳戶，密碼
        Conn.ConnectionString = @"Data Source=ccweng\ccweng;Initial Catalog=" + dataBase +";Integrated Security=True";
        //Conn.ConnectionString = "<%$ ConnectionStrings:NorthwindConnectionString %>";
        //這一行可依連線的字串不同而去定義它該連線到哪個資料庫!!

        cmd.CommandText = comment;   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(dt);            //da把資料填入dt裡面
        gridView.DataSource = dt;
        gridView.DataBind();
        Conn.Close();
    }



    protected void datepicker1_TextChanged(object sender, EventArgs e)
    {
        if (datepicker2.Text != "")
        {
            string d1 = datepicker1.Text.Replace("-", "");
            string d2 = datepicker2.Text.Replace("-", "");
            string command = "SELECT  * from 通訊軟體分析結果 where  (分析開始時間) between '" + datepicker1.Text.Replace("-", "") + " 00:00:00.000' and '" + datepicker2.Text.Replace("-", "") + " 23:59:59.999'";
            this.BindGrid(GridView2, "數據分析資料庫", command);

        }
    }
}