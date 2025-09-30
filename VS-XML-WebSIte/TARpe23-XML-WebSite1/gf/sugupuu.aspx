<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sugupuu.aspx.cs" Inherits="xml_webapp.sugupuu_ylesanne.sugupuu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Trüki välja kõikide inimeste sünniaastad</h1>
        <div>
            <asp:Xml ID="xml1" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml" TransformSource="~/sugupuu_ylesanne/koikide_synni_aastad.xslt"></asp:Xml>
        </div>
        <h1>Väljasta nimed, kellel on vähemalt kaks last</h1>
        <div>
            <asp:Xml ID="xml2" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml" TransformSource="~/sugupuu_ylesanne/kaks_last.xslt"></asp:Xml>
        </div>
        <h1>Väljasta sugupuus leiduvad andmed tabelina & Kus võimalik, seal väljasta tabelis iga inimese vanema nimi & Väljasta tabelis ka vanavanema nimi</h1>
        <div>
            <asp:Xml ID="xml3" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml" TransformSource="~/sugupuu_ylesanne/tabelina.xslt"></asp:Xml>
        </div>
        <h1>Kuva iga lapse vanus (laps - inimene, kellel pole järglasi)</h1>
        <div>
            <asp:Xml ID="xml4" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml" TransformSource="~/sugupuu_ylesanne/lapsed.xslt"></asp:Xml>
        </div>
        <h1>Väljasta iga inimese juures, mitmendal oma vanema sünniaastal ta sündis</h1>
        <div>
            <asp:Xml ID="xml5" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml" TransformSource="~/sugupuu_ylesanne/vanem_synni_ajal.xslt"></asp:Xml>
        </div>
        <h1>Tehke vormid ja teostage nimest teatud sümbolite ning nime pikkuse järgi otsimine</h1>
        <div>
            <pre>
 <asp:Xml ID="xml6" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml"
TransformSource="~/sugupuu_ylesanne/otsing.xslt" />
 </pre>
            Otsitav tekst:
        <asp:TextBox ID="kast1" runat="server" /><br />
            Miinimumpikkus:
        <asp:TextBox ID="kast2" runat="server" /><br />
            <asp:Button runat="server" Text="Sisesta" />
        </div>
        <h1>Kõik nimed, mille pikkus on alla 7 värvida (taustavärv) roheliseks</h1>
        <div>
            <asp:Xml ID="xml7" runat="server" DocumentSource="~/sugupuu_ylesanne/sugupuu.xml" TransformSource="~/sugupuu_ylesanne/varv.xslt"></asp:Xml>
        </div>
    </form>
</body>
</html>
