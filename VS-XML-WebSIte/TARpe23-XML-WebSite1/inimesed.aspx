<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inimesed.aspx.cs" Inherits="XMl_WebSite1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Xml ID="xml" runat="server" DocumentSource="~/inimesed.xml" TransformSource="~/inimesed.xsl" />
        </div>
        <div>
            <asp:Xml ID="xml2" runat="server" DocumentSource="~/inimesed.xml" TransformSource="~/inimesed1.xsl" />
        </div>
        <div>
            <asp:Xml ID="xml3" runat="server" DocumentSource="~/inimesed.xml" TransformSource="~/inimesed2.xslt" />
        </div>
        <div>
            <asp:Xml ID="xml4" runat="server" DocumentSource="~/inimesed.xml" TransformSource="~/inimesed3.xslt" />
        </div>
    </form>
</body>
</html>
