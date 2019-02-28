<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/analysis.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin" runat="server">
      <img class="mb-4" src="img/analysis.ico" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">請登入</h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      
        <asp:TextBox ID="account" runat="server"  class="form-control" placeholder="帳號" ></asp:TextBox>
        <asp:RequiredFieldValidator   ControlToValidate="account"   Text="帳號是必填的！"  runat="server" />
       <label for="inputPassword" class="sr-only">Password</label>
       
        <asp:TextBox ID="password" runat="server"  class="form-control" placeholder="密碼" ></asp:TextBox>
        <asp:RequiredFieldValidator   ControlToValidate="password"   Text="密碼是必填的！"  runat="server" />
       <br>
        <asp:Button ID="Button1" runat="server" Text="登入" class="btn btn-lg btn-primary btn-block" OnClick="Button1_Click" />
      <p class="mt-5 mb-3 text-muted">Copyright &copy; Discover 2018</p>
       
    </form>
  </body>
</html>

