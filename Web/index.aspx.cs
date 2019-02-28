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
    
        DataSet ds = new DataSet();       
        string command;        
        //Number_of_User
        command = "select count (distinct(帳號)) FROM 登入紀錄 WHERE 登入時間 between '20180205 00:00:00.000' AND'20190305 23:59:59.997'";   //執行SQL語法進行查詢       
        ds = sql(command);
        user_monthly.Text = (ds.Tables["result"].Rows[0][0].ToString());
        ds.Clear();
        
        //Number_of_Groups
        command = "select count (distinct(單位)) FROM 登入紀錄 WHERE 登入時間 between '20180205 00:00:00.000' AND'20190305 23:59:59.997'";   //執行SQL語法進行查詢       
        ds = sql(command);                     
        number_group.Text = (ds.Tables["result"].Rows[0][0].ToString());    
        ds.Clear();

        //Number_of_Communications & Discs
        command = "select count (通訊軟體類型) , count(distinct[分析開始時間]) FROM 通訊軟體分析結果 WHERE 開始時間 between '20180101 00:00:00.000' AND'20190331 23:59:59.997' and ((帳號) <> 'm51031') and ((帳號) <> 'm59381')";   //執行SQL語法進行查詢        
        ds = sql(command);
        Communications.Text = (ds.Tables["result"].Rows[0][0].ToString());
        number_of_discs.Text = (ds.Tables["result"].Rows[0][1].ToString());
        ds.Clear();


        //pie chart 計算各通訊軟體在2019年有多少次通話紀錄被軟體分析出來
        command = "select (通訊軟體類型) , count (通訊軟體類型) , count(distinct[分析開始時間]) FROM 通訊軟體分析結果 WHERE 開始時間 between '20180101 00:00:00.000' AND'20190305 23:59:59.997' and ((帳號) <> 'm51031') and ((帳號) <> 'm59381') group by (通訊軟體類型) ";   //執行SQL語法進行查詢
        //cmd.CommandText = "SELECT country from customers ";   //執行SQL語法進行查詢
        ds = sql(command);
        string[] commuAry = new string[ds.Tables["result"].Rows.Count];
        for (int loopcounter = 0; loopcounter < ds.Tables["result"].Rows.Count; loopcounter++)
          {
              //assign dataset values to array
              commuAry[loopcounter] = ds.Tables["result"].Rows[loopcounter][1].ToString();
          }
        HiddenField1.Value = string.Join(",", commuAry);
         //pie chart end

        //myAreaChart
        commuAry = new string[12];
        for (int loopcounter = 1; loopcounter < 13; loopcounter++)
        {
            //assign dataset values to array
            string month;
            if (loopcounter < 10)
                month = "0" + loopcounter.ToString();
            else
                month = loopcounter.ToString();
            command = "select count(distinct[分析開始時間]) FROM 通訊軟體分析結果 WHERE 開始時間 between '2019"+month+"01 00:00:00.000' AND'2019"+month+"31 23:59:59.997' and ((帳號) <> 'm51031') and ((帳號) <> 'm59381')";   //執行SQL語法進行查詢
            ds = sql(command);
           
            commuAry[loopcounter-1] = ds.Tables["result"].Rows[0][0].ToString();
        }
        HiddenField2.Value = string.Join(",", commuAry);
        
        


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