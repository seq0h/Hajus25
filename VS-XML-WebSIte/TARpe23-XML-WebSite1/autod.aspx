<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autod.aspx.cs" Inherits="XMl_WebSite1.autod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Autod</h1>
            <div>
                <asp:Xml ID="xml" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod.xslt" />
            </div>
            <div>
                <asp:Xml ID="xml1" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod1.xslt" />
            </div>
            <div>
                <asp:Xml ID="xml2" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod2.xslt" />
            </div>
            <div>
                <asp:Xml ID="xml3" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod3.xslt" />
            </div>            
            <div>
                <asp:Xml ID="xml4" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod4.xslt" />
            </div>
        </div>
    </form>
</body>
</html>
