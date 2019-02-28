<%@ Page Language="C#" AutoEventWireup="true" CodeFile="table.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>Discover - Tables</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $(function () {
          $("#datepicker1").datepicker({
              showWeek: true,
              firstDay: 1,
              dateFormat: 'yy-mm-dd'
          });
      });

      $(function () {
          $("#datepicker2").datepicker({
              showWeek: true,
              firstDay: 1,
              dateFormat: 'yy-mm-dd'
          });
      });

  </script>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet"/>

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"/>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css" rel="stylesheet"/>




    <!-- Gridview Css-->
    <style type="text/css">
        .gv
        {
            border: 1px solid #D7D7D7;
            font-size:12px;
            text-align:center;
        }
        .gvHeader
        {
            color: #3F6293;
            background-color: #F7F7F7;
            height: 24px;
            line-height: 24px;
            text-align: center;
            font-weight: normal;
            font-variant: normal;
        }
        .gvHeader th
        {
            font-weight: normal;
            font-variant: normal;
        }
        .gvRow, .gvAlternatingRow, .gvEditRow
        {
            line-height: 20px;
            text-align: center;
            padding: 2px;
            height: 20px;
        }
        .gvAlternatingRow
        {
            background-color: #F5FBFF;
        }
        .gvEditRow
        {
            background-color: #FAF9DD;
        }
        .gvEditRow input
        {
            background-color: #FFFFFF;
            width: 80px;
        }
        .gvEditRow .gvOrderId input, .gvEditRow .gvOrderId
        {
            width: 30px;
        }
        .gvEditRow .checkBox input, .gvEditRow .checkBox
        {
            width: auto;
        }
        .gvCommandField
        {
            text-align: center;
            width: 130px;
        }

        .gvLeftField
        {
            text-align: left;
            padding-left: 10px;
        }
        .gvBtAField
        {
            text-align: center;
            width: 130px;
        }
        .gvCommandField input
        {
            background-image: url(../Images/gvCommandFieldABg.jpg);
            background-repeat: no-repeat;
            line-height: 23px;
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            width: 50px;
            height: 23px;
            margin-right: 3px;
            margin-left: 3px;
            text-indent: 10px;
        }
        .gvPage
        {
            padding-left: 15px;
            font-size: 18px;
            color: #333333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .gvPage a
        {
            display: block;
            text-decoration: none;
            padding-top: 2px;
            padding-right: 5px;
            padding-bottom: 2px;
            padding-left: 5px;
            border: 1px solid #FFFFFF;
            float: left;
            font-size: 12px;
            font-weight: normal;
        }
        .gvPage a:hover
        {
            display: block;
            text-decoration: none;
            border: 1px solid #CCCCCC;
        }

        /*tables*/

         .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: pink;
        }

        .table-striped > tbody > tr:nth-of-type(even) {
            background-color: lightblue;
        }
        .table-striped > tbody > tr:nth-of-type(1) {
           background-color: black;
            color: white;
        }
         .table-striped > tbody > tr:nth-of-type(5n+7) {
           background-color: white;
            color: white;
        }

        .table-striped > thead > tr {
            background-color: black;
            color: white;
        }

        .table-hover > tbody > tr:hover {
            background-color: #ffd800;
        }

  </style>

   
</head>

<body id="page-top">

    <form id="form1" runat="server">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

              <!-- Sidebar - Brand -->
              <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.aspx">
                <div class="sidebar-brand-icon rotate-n-15">
                  <i class="fab fa-cc-discover"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Discover</div>
              </a>

              <!-- Divider -->
              <hr class="sidebar-divider my-0">

              <!-- Nav Item - Dashboard -->
              <li class="nav-item active">
                <a class="nav-link" href="index.aspx">
                  <i class="fas fa-fw fa-tachometer-alt"></i>
                  <span>Dashboard</span></a>
              </li>

               <!-- Divider -->
              <hr class="sidebar-divider">

              <!-- Heading -->
              <div class="sidebar-heading">
                Statistics & Records
              </div>

              <!-- Nav Item - Pages Collapse Menu -->
                <!--
              <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                  <i class="fas fa-fw fa-folder"></i>
                  <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                  </div>
                </div>
              </li>
                -->
              <!-- Nav Item - Charts -->
              <li class="nav-item">
                <a class="nav-link" href="charts.aspx">
                  <i class="fas fa-fw fa-chart-area"></i>
                  <span>Charts</span></a>
              </li>

              <!-- Nav Item - Tables -->
              <li class="nav-item">
                <a class="nav-link" href="table.aspx">
                  <i class="fas fa-fw fa-table"></i>
                  <span>Tables</span></a>
              </li>

              <!-- Divider -->
              <hr class="sidebar-divider d-none d-md-block">

              <!-- Sidebar Toggler (Sidebar) -->
              <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
              </div>

            </ul>
            <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800"></h1>
          <p class="mb-4"> <a target="_blank" href="https://datatables.net"></a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Customers List</h6>               
            </div>
            
              <div class="card-body">
              <div class="table-responsive">
                <div id="ss" class="dataTables_wrapper dt-bootstrap4">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dat_length" id="dataTable_length">
                                <Label><nobr>Show 
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                    </asp:DropDownList>
                                     entries
                                </nobr></Label>
                            </div>

                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div id="datae_filter" class="dataTables_filter">
                            </div>
                        </div>

                    </div>
                    <div class="row">
                     
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="table table-hover table-bordered table-striped" PageSize="5"  ></asp:GridView>


                    </div>
                    <!--
                    <div class="row">
                        <div class="col-sm-12">
                  
                  
                   <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries

                        </div>

                    </div>
                    <div class="col-sm-12 col-md-7">
                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                            <ul class="pagination">
                                <li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>

                                </li>
                                <li class="paginate_button page-item active">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>

                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>

                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>

                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>

                                </li>
                                <li class="paginate_button page-item next" id="dataTable_next">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
                                </li>

                            </ul></div></div></div></div>
              </div>

            </div>

        </div>
        <!-- /.container-fluid -->
                    

      </div>
      <!-- End of Main Content -->

      

    </div>
    <!-- End of Content Wrapper -->

  </div>

             <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">通訊軟體分析結果</h6>               
            </div>
            
              <div class="card-body">
              <div class="table-responsive">
                <div id="ss" class="dataTables_wrapper dt-bootstrap4">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dat_length" id="dataTable_length">
                                <Label>
                                    <nobr>
                                        Show 
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                        </asp:DropDownList>
                                         entries
                                        
                                    </nobr>

                                </Label>
                            </div>
                             

                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div>
                                 Date:  from 
                                <!--<input type="text" id="datepicker1"/>-->  
                                 <asp:TextBox ID="datepicker1" runat="server" AutoPostBack="True" OnTextChanged="datepicker1_TextChanged"></asp:TextBox>
                                 to  
                                <!--<input type="text" id="datepicker2"/>-->  
                                 <asp:TextBox ID="datepicker2" runat="server" AutoPostBack="True"></asp:TextBox>
                             </div>
                        </div>

                    </div>
                    <div class="row">
                     
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" CssClass="table table-hover table-bordered table-striped" PageSize="5"  ></asp:GridView>


                    </div>
                    <!--
                    <div class="row">
                        <div class="col-sm-12">
                  
                  
                   <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries

                        </div>

                    </div>
                    <div class="col-sm-12 col-md-7">
                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                            <ul class="pagination">
                                <li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>

                                </li>
                                <li class="paginate_button page-item active">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>

                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>

                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>

                                </li>
                                <li class="paginate_button page-item ">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>

                                </li>
                                <li class="paginate_button page-item next" id="dataTable_next">
                                    <a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
                                </li>

                            </ul></div></div></div></div>
              </div>

            </div>

        </div>
        <!-- /.container-fluid -->
                    

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Discover 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <!--<script src="vendor/jquery/jquery.min.js"></script>-->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
   <!--<script src="vendor/jquery-easing/jquery.easing.min.js"></script>-->

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <!--<script src="vendor/datatables/jquery.dataTables.min.js"></script>-->
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>

    </form>



</body>

</html>
