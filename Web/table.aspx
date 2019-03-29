<%@ Page Language="C#" AutoEventWireup="true" CodeFile="table.aspx.cs" Inherits="table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>New_Hope-Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="css/table.css" rel="stylesheet" />

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body id="page-top">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

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




                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                        <p class="mb-4">
                            <a target="_blank" href="https://datatables.net"></a>.
                           
                        </p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">通聯記錄</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-5">
                                            <div class="dataTables_length" id="dataTable_length">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <label>
                                                            Show    
                                                        
                                                                <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select custom-select-sm form-control form-control-sm" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                    <asp:ListItem Selected="True">5</asp:ListItem>
                                                                    <asp:ListItem>10</asp:ListItem>
                                                                    <asp:ListItem>15</asp:ListItem>
                                                                    <asp:ListItem>20</asp:ListItem>
                                                                </asp:DropDownList>

                                                            entries                                                          
                                                        </label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-7" style="display:inline-block;" id="date_selector">

                                            <label>
                                                日期:                                                   
                                                 <asp:TextBox ID="TextBox1" runat="server" class="custom-select custom-select-sm form-control form-control-sm"></asp:TextBox>
                                                到
                                                 <asp:TextBox ID="TextBox2" runat="server" class="custom-select custom-select-sm form-control form-control-sm"></asp:TextBox>
                                            </label>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" style="display:inline-block;">
                                                <ContentTemplate>
                                                    <asp:Button ID="Button1" runat="server" Text="搜尋" class="btn btn-success" OnClick="Button1_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>



                                    </div>
                                    <br/>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="GridView3"
                                                class="table table-bordered" runat="server" AllowPaging="True" PageSize="5" AllowCustomPaging="True" OnPageIndexChanging="GridView3_PageIndexChanging" AllowSorting="True" OnSorting="TaskGridView_Sorting" OnRowDataBound="GridView3_RowDataBound">
                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="第一頁" LastPageText="最後一頁" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>


                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">登入紀錄</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-5">
                                            <div class="dataTables_length" >
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <label>
                                                            Show    
                                                        
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select custom-select-sm form-control form-control-sm" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                                    <asp:ListItem Selected="True">5</asp:ListItem>
                                                                    <asp:ListItem>10</asp:ListItem>
                                                                    <asp:ListItem>15</asp:ListItem>
                                                                    <asp:ListItem>20</asp:ListItem>
                                                                </asp:DropDownList>

                                                            entries                                                          
                                                        </label>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-7" style="display:inline-block;" id="date_selector">

                                            <label>
                                                日期:                                                   
                                                 <asp:TextBox ID="TextBox3" runat="server" class="custom-select custom-select-sm form-control form-control-sm"></asp:TextBox>
                                                到
                                                 <asp:TextBox ID="TextBox4" runat="server" class="custom-select custom-select-sm form-control form-control-sm"></asp:TextBox>
                                            </label>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" style="display:inline-block;">
                                                <ContentTemplate>
                                                    <asp:Button ID="Button2" runat="server" Text="搜尋" class="btn btn-success" OnClick="Button2_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>



                                    </div>
                                    <br/>
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="GridView1"
                                                class="table table-bordered" runat="server" AllowPaging="True" PageSize="5" AllowCustomPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" AllowSorting="True" OnSorting="GridView1_Sorting" OnRowDataBound="GridView1_RowDataBound">
                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="第一頁" LastPageText="最後一頁" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
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

    </form>


    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#TextBox1").datepicker({
                dateFormat: "yy/mm/dd"
            });
            $("#TextBox2").datepicker({
                dateFormat: "yy/mm/dd"
            });
            $("#TextBox3").datepicker({
                dateFormat: "yy/mm/dd"
            });
            $("#TextBox4").datepicker({
                dateFormat: "yy/mm/dd"
            });
        });
    </script>


</body>
</html>

