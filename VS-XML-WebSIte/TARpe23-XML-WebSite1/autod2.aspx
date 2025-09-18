<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autod2.aspx.cs" Inherits="XMl_WebSite1.autod2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Xml ID="xml" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod5.xslt" />
            </div>
        </div>
    </form>
</body>
</html>
