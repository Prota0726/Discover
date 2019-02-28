using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Authentication(account.Text, password.Text))
            Response.Redirect("index.aspx");
        else
            HttpContext.Current.Response.Write("<script>alert('帳號或密碼有錯！')</script>");
            
    }

    private bool  Authentication(string account, string password)
    {

        string command = "SELECT  EmployeeID from Employees where  (LastName) = '" + account + "' ";
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //da.Fill(dt);

        SqlConnection Conn = new SqlConnection();       //宣告SQL的連線
        SqlCommand cmd = new SqlCommand();              //宣告對SQL執行的語法
        SqlDataAdapter da = new SqlDataAdapter();       //SQL 資料庫的連接與執行命令
        //DataSet ds = new DataSet();                     //宣告一個資料表存放在暫存記憶體內

        cmd.Connection = Conn;   //將SQL執行的命令語法程式CMD與CONN與SQL連接


        //設定連線IP位置、資料表，帳戶，密碼
        Conn.ConnectionString = @"Data Source=ccweng\ccweng;Initial Catalog=" + "Northwind" + ";Integrated Security=True";
        //Conn.ConnectionString = "<%$ ConnectionStrings:NorthwindConnectionString %>";
        //這一行可依連線的字串不同而去定義它該連線到哪個資料庫!!

        cmd.CommandText = command;   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(ds,"result");            //da把資料填入dt裡面
        if (ds.Tables["result"].Rows[0][0].ToString() == password)
            return true;
        else
            return false;
        
        Conn.Close();
    }
}