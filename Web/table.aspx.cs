using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class table : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {          
            GridView3.VirtualItemCount = MIS2000Lab_GetPageCount();  // 取得總記錄的數量。
            Session["TaskTable"] = MIS2000Lab_GetPageData(0);
            GridView3.DataSource = Session["TaskTable"];
            GridView3.DataBind();
        }
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        Session["TaskTable"] = MIS2000Lab_GetPageData(e.NewPageIndex);
        GridView3.DataSource = Session["TaskTable"];
        GridView3.DataBind();
    }


    protected void TaskGridView_Sorting(object sender, GridViewSortEventArgs e)
    {

        //Retrieve the table from the session object.
        DataTable dt = Session["TaskTable"] as DataTable;

        if (dt != null)
        {

            //Sort the data.
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            GridView3.DataSource = Session["TaskTable"];
            GridView3.DataBind();
        }

    }
    private string GetSortDirection(string column)
    {

        // By default, set the sort direction to ascending.
        string sortDirection = "ASC";

        // Retrieve the last column that was sorted.
        string sortExpression = ViewState["SortExpression"] as string;

        if (sortExpression != null)
        {
            // Check if the same column is being sorted.
            // Otherwise, the default value can be returned.
            if (sortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }
        }

        // Save new values in ViewState.
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = column;

        return sortDirection;
    }



    protected DataTable MIS2000Lab_GetPageData(int currentPage )
    {
        string date_beging= "";
        string date_end = "";
        if (IsDate(TextBox1.Text) && IsDate(TextBox2.Text))
        {
            date_beging = TextBox1.Text.Replace("/", "").ToString();
            date_end = TextBox2.Text.Replace("/", "").ToString();
            if (int.Parse(date_beging) > int.Parse(date_end))
            {
                date_beging = date_end;
                date_end = TextBox1.Text.Replace("/", "").ToString();
            }
        }
        String SqlStr = "SELECT * FROM 通訊軟體分析結果 order by ID";
        if (date_beging != "" && date_end != "")
            SqlStr = "SELECT * FROM 通訊軟體分析結果  where 分析開始時間 between '" + date_beging + " 00:00:00.000' and '" + date_end + " 23:59:59.999' order by ID";
        SqlConnection Conn = new SqlConnection(@"Data Source=ccweng\ccweng;Initial Catalog=" + "數據分析資料庫" + ";Integrated Security=True");
        SqlDataReader dr = null;
        
       
            
        SqlStr += " OFFSET " + (currentPage * GridView3.PageSize) + " ROWS FETCH NEXT " + GridView3.PageSize + " ROWS ONLY";
        //==SQL 2012 指令的 Offset...Fetch。

        SqlCommand cmd = new SqlCommand(SqlStr, Conn);
        // 參數寫法，避免SQL Injection攻擊
        cmd.Parameters.AddWithValue("@A", (currentPage * GridView3.PageSize));
        cmd.Parameters.AddWithValue("@B", GridView3.PageSize);

        DataTable DT = new DataTable();

        try
        {   //== 第一，連結資料庫。
            Conn.Open();
            //== 第二，執行SQL指令。
            dr = cmd.ExecuteReader();

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            //==自己寫迴圈==
            DT.Load(dr);    // 將DataReader的成果 "載入" DataTable裡面。
            //foreach (DataColumn dc in DT.Columns)
            //{
            //    Response.Write(dc.ColumnName + "<br/>");
            //    Response.Write(DT.Rows[0][dc.ColumnName].ToString() + "<br/>");
            //}
        }
        //catch (Exception ex)
        //{   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        //}
        finally
        {
            // == 第四，釋放資源、關閉資料庫的連結。
            if (dr != null)
            {
                cmd.Cancel();
                dr.Close();
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
        }

        return DT;
    }


    // ***** 取得總記錄的數量。*****
    protected int MIS2000Lab_GetPageCount()
    {
        SqlConnection Conn = new SqlConnection(@"Data Source=ccweng\ccweng;Initial Catalog=" + "數據分析資料庫" + ";Integrated Security=True");
        SqlCommand cmd = new SqlCommand("select Count(id) from [通訊軟體分析結果]", Conn);
        int myPageCount = 0;
        try
        {
            //== 第一，連結資料庫。
            Conn.Open();

            //== 第二，執行SQL指令。
            myPageCount = (int)cmd.ExecuteScalar();

            //==第三，自由發揮，把執行後的結果呈現到畫面上。

        }
        //catch (Exception ex)
        //{   //---- 如果程式有錯誤或是例外狀況，將執行這一段
        //}
        finally
        {
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose();
            }
        }

        return myPageCount;
    }



    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //取得Pager Row
        if (e.Row.RowType == DataControlRowType.Pager)
        {
            //取得內崁的TableRow
            TableRow trPager = (TableRow)e.Row.Controls[0].Controls[0].Controls[0];
            for (int i = 0; i < trPager.Controls.Count; i++)
            {
                TableCell tcPager = (TableCell)trPager.Controls[i];
                for (int j = 0; j < tcPager.Controls.Count; j++)
                {
                    //...格式必為LinkButton
                    if (tcPager.Controls[j].ToString() == "System.Web.UI.WebControls.DataControlPagerLinkButton")
                    {
                        //原Number顯示方式為"... 11 12 13 14 15 16 17 18 19 20 ..."
                        //故 (i=0 && LinkButton.Text="..."), 即目前頁數>10
                        LinkButton lbtn = (LinkButton)tcPager.Controls[j];
                        if ((lbtn.Text == "&lt;&lt;") && (i == 0))
                        {
                            lbtn.Text = "第一頁 ";
                        }
                        else if ((lbtn.Text == "...") && (i == 1))
                        {
                            lbtn.Text = "上十頁 ";
                        }
                        else if (lbtn.Text == "...")
                        {
                            lbtn.Text = " 下十頁";
                        }
                        else if (lbtn.Text == "&gt;&gt;")
                        {
                            lbtn.Text = " 最後頁";
                        }
                    }
                }
            }
        }
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView3.PageSize = int.Parse(DropDownList1.SelectedItem.Value);
        Session["TaskTable"] = MIS2000Lab_GetPageData(0);
        GridView3.DataSource = Session["TaskTable"];
        GridView3.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

        Session["TaskTable"] = MIS2000Lab_GetPageData(0);
        GridView3.DataSource = Session["TaskTable"];
        GridView3.DataBind();

    }


    public bool IsDate(string strDate)
    {
        try
        {
            DateTime.Parse(strDate);
            return true;
        }
        catch
        {
            return false;
        }
    }

}
