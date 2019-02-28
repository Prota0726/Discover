<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title> New_Hope-Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet"/>





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

                
                  

                <!-- Begin Page Content -->
                <div class="container-fluid">

                  <!-- Page Heading -->
                  <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    <!--a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</!--a-->
                  </div>

                  <!-- Content Row -->
                  <div class="row">

                    <!-- User (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                      <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                          <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Number of  Users</div>
                              <div class="h5 mb-0 font-weight-bold text-gray-800"> 
                                  <asp:Label ID="user_monthly" runat="server"></asp:Label>
                              </div>
                            </div>
                            <div class="col-auto">
                              <i class="fas fa-child fa-2x text-gray-300"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                      <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                          <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Number of  Group</div>
                              <div class="h5 mb-0 font-weight-bold text-gray-800">
                                  <asp:Label ID="number_group" runat="server" ></asp:Label>
                              </div>
                            </div>
                            <div class="col-auto">
                              <i class="fas fa-building fa-2x text-gray-300"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                      <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                          <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Number of Communications</div>
                              <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                  <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                      <asp:Label ID="Communications" runat="server" ></asp:Label>
                                    </div>
                                </div>
                                <div class="col">
                                    <!--
                                  <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                    -->
                                </div>
                              </div>
                            </div>
                            <div class="col-auto">
                              <i class="fas fa-comment-dots fa-2x text-gray-300"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                      <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                          <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                              <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Number of Discs</div>
                              <div class="h5 mb-0 font-weight-bold text-gray-800">
                                  <asp:Label ID="number_of_discs" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                              <i class="fas fa-compact-disc fa-2x text-gray-300"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                   
                  </div>

                  <!-- Content Row -->

                  <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                      <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">Discs Overview</h6>
                          <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                              <div class="dropdown-header">Dropdown Header:</div>
                              <a class="dropdown-item" href="#">Action</a>
                              <a class="dropdown-item" href="#">Another action</a>
                              <div class="dropdown-divider"></div>
                              <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                          </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                          <div class="chart-area">
                            <canvas id="myAreaChart"></canvas>
                              <asp:HiddenField ID="HiddenField2" runat="server" />
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                      <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                          <h6 class="m-0 font-weight-bold text-primary">Ratio of Apps</h6>
                          <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                              <div class="dropdown-header">Dropdown Header:</div>
                              <a class="dropdown-item" href="#">Action</a>
                              <a class="dropdown-item" href="#">Another action</a>
                              <div class="dropdown-divider"></div>
                              <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                          </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                          <div class="chart-pie pt-4 pb-2">
                            <canvas id="myPieChart"></canvas>
                             <asp:HiddenField ID="HiddenField1" runat="server" />
                          </div>
                          <asp:HiddenField ID="hf_time" runat="server" />
                          <div class="mt-4 text-center small">
                            <span class="mr-2">
                              <i class="fas fa-circle text-primary"></i> Line
                            </span>
                            <span class="mr-2">
                              <i class="fas fa-circle text-success"></i> Facetime
                            </span>
                            <span class="mr-2">
                              <i class="fas fa-circle text-info"></i> Wechat
                            </span>
                              <span class="mr-2">
                              <i class="fas fa-circle text-danger"></i> Whatsapp
                            </span>
                              <span class="mr-2">
                              <i class="fas fa-circle text-warning"></i> Skype
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Content Row -->
                  <div class="row">

                    <!-- Content Column -->
                    <div class="col-lg-3 mb-2">

                      <!-- Project Card Example -->
                      

                      <!-- Color System -->
                      

                    </div>

                    <div class="col-lg-6 mb-4">

                      <!-- Illustrations -->
                     

                      <!-- Approach -->
                      <div class="card shadow mb-4">
                        <div class="card-header py-3">
                          <h6 class="m-0 font-weight-bold text-primary">Announcement</h6>
                        </div>
                        <div class="card-body">
                          <p>此網頁用於協助管理者瞭解數據資料庫的資訊，以便Discover的開發團隊能夠即時地，以視覺化的方式瞭解目前軟體在各地之使用狀況。</p>
                          
                        </div>
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
  <script src="js/demo/chart-area-demo.js"></script>
  <!--script src="dashboard/js/demo/chart-pie-demo.js"></!--script-->
    



  <!-- Chart Pie -->
  <script type="text/javascript">
     
     
     
      // Set new default font family and font color to mimic Bootstrap's default styling
      Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#858796';

      // Pie Chart Example
      
      var ctx = document.getElementById("myPieChart");
      var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
              labels: ["Line", "Facetime", "Wechat", "Whatsapp", "Skype"],
              datasets: [{
                  data: document.getElementById("HiddenField1").value.split(","),
                  backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#e74a3b', '#f6c23e'],
                  hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                  hoverBorderColor: "rgba(234, 236, 244, 1)",
              }],
          },
          options: {
              maintainAspectRatio: false,
              tooltips: {
                  backgroundColor: "rgb(255,255,255)",
                  bodyFontColor: "#858796",
                  borderColor: '#dddfeb',
                  borderWidth: 1,
                  xPadding: 15,
                  yPadding: 15,
                  displayColors: false,
                  caretPadding: 10,
              },
              legend: {
                  display: false
              },
              cutoutPercentage: 80,
          },
      });
    </script>  
</body>
</html>
