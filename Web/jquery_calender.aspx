<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jquery_calender.aspx.cs" Inherits="jquery_calender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>jQuery UI Datepicker - Show week of the year</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $(function () {
          $("#datepicker").datepicker({
              showWeek: true,
              firstDay: 1
          });
      });
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <p>Date: <input type="text" id="datepicker"></p>
    </form>
</body>
</html>
