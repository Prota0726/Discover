using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
    
        //記錄各個月的使用人數
        DataSet ds = new DataSet();       
        string command;        
 
        //myAreaChart
        string[]  commuAry = new string[12];
        for (int loopcounter = 1; loopcounter < 13; loopcounter++)
        {
            //assign dataset values to array
            string month;
            if (loopcounter < 10)
                month = "0" + loopcounter.ToString();
            else
                month = loopcounter.ToString();
            command = "select count(distinct[帳號]) FROM 登入紀錄 WHERE 登入時間 between '2019" + month + "01 00:00:00.000' AND'2019" + month + "31 23:59:59.997' and ((帳號) <> 'm51031') and ((帳號) <> 'm59381')";   //執行SQL語法進行查詢
            ds = sql(command);
           
            commuAry[loopcounter-1] = ds.Tables["result"].Rows[0][0].ToString();
        }
        HiddenField1.Value = string.Join(",", commuAry);
        
        


    }
    private DataSet sql(string command)
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
        Conn.ConnectionString = @"Data Source=ccweng\ccweng;Initial Catalog=" + "數據分析資料庫" + ";Integrated Security=True";
        //Conn.ConnectionString = "<%$ ConnectionStrings:NorthwindConnectionString %>";
        //這一行可依連線的字串不同而去定義它該連線到哪個資料庫!!

        cmd.CommandText = command;   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(ds, "result");            //da把資料填入dt裡面
       

        Conn.Close();
        return ds;
    }
}