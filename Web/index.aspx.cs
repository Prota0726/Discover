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

        
        //hf_time.Value = "TEST";
        //DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //da.Fill(dt);

        SqlConnection Conn = new SqlConnection();       //宣告SQL的連線
        SqlCommand cmd = new SqlCommand();              //宣告對SQL執行的語法
        SqlDataAdapter da = new SqlDataAdapter();       //SQL 資料庫的連接與執行命令
        cmd.Connection = Conn;   //將SQL執行的命令語法程式CMD與CONN與SQL連接
        //設定連線IP位置、資料表，帳戶，密碼
        Conn.ConnectionString = @"Data Source=ccweng\ccweng;Initial Catalog=數據分析資料庫;Integrated Security=True";
        cmd.CommandText = "select count (distinct(帳號)) FROM 登入紀錄 WHERE 登入時間 between '20180205 00:00:00.000' AND'20190305 23:59:59.997'";   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(ds, "result");            //da把資料填入ds裡面
        user_monthly.Text = (ds.Tables["result"].Rows[0][0].ToString());
        ds.Clear();
        

        cmd.CommandText = "select count (distinct(單位)) FROM 登入紀錄 WHERE 登入時間 between '20180205 00:00:00.000' AND'20190305 23:59:59.997'";   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(ds, "result");            //da把資料填入ds裡面
        
        number_group.Text = (ds.Tables["result"].Rows[0][0].ToString());
        
        ds.Clear();

        cmd.CommandText = "select count (通訊軟體類型) , count(distinct[分析開始時間]) FROM 通訊軟體分析結果 WHERE 開始時間 between '20180205 00:00:00.000' AND'20190305 23:59:59.997' and ((帳號) <> 'm51031') and ((帳號) <> 'm59381')";   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(ds, "result");            //da把資料填入ds裡面
        Communications.Text = (ds.Tables["result"].Rows[0][0].ToString());
        number_of_discs.Text = (ds.Tables["result"].Rows[0][1].ToString());
        ds.Clear();


        //pie chart 計算各通訊軟體在2019年有多少次通話紀錄被軟體分析出來
        cmd.CommandText = "select (通訊軟體類型) , count (通訊軟體類型) , count(distinct[分析開始時間]) FROM 通訊軟體分析結果 WHERE 開始時間 between '20180205 00:00:00.000' AND'20190305 23:59:59.997' and ((帳號) <> 'm51031') and ((帳號) <> 'm59381') group by (通訊軟體類型) ";   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        da.SelectCommand = cmd;            //da選擇資料來源，由cmd載入進來
        da.Fill(ds, "result");            //da把資料填入ds裡面
        string[] commuAry = new string[ds.Tables["result"].Rows.Count];
        for (int loopcounter = 0; loopcounter < ds.Tables["result"].Rows.Count; loopcounter++)
          {
              //assign dataset values to array
              commuAry[loopcounter] = ds.Tables["result"].Rows[loopcounter][0].ToString();
          }
        HiddenField1.Value = string.Join(",", commuAry);
         //pie chart 

    }
}