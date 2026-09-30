<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="Vidyakendraa.Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .row-flex {
            display: flex;
            gap: 20px;
        }

        .pdf-box {
            width: 25%;
            height: 800px;
            border: 1px solid #ccc;
        }

        .pdf-box1 {
            width: 75%;
            height: 800px;
            border: 1px solid #ccc;
        }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Devanagari:wght@100..900&display=swap" rel="stylesheet">
    <h3>PDF Language Converter</h3>
    <asp:DropDownList ID="ddlLanguage" runat="server" AutoPostBack="true"
        OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged">

        <%-- Default --%>
        <asp:ListItem Text="Select Language" Value="" Selected="True"></asp:ListItem>
        <%-- Indian Languages --%>
        <asp:ListItem Text="Hindi" Value="hi"></asp:ListItem>
        <asp:ListItem Text="English" Value="en"></asp:ListItem>
        <asp:ListItem Text="Tamil" Value="ta"></asp:ListItem>
        <asp:ListItem Text="Bengali" Value="bn"></asp:ListItem>
        <asp:ListItem Text="Gujarati" Value="gu"></asp:ListItem>
        <asp:ListItem Text="Kannada" Value="kn"></asp:ListItem>
        <asp:ListItem Text="Marathi" Value="mr"></asp:ListItem>
        <asp:ListItem Text="Telugu" Value="te"></asp:ListItem>

        <%-- Other Languages --%>
        <asp:ListItem Text="French" Value="fr"></asp:ListItem>
        <asp:ListItem Text="Spanish" Value="es"></asp:ListItem>

    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" CssClass="text-danger fw-bold"></asp:Label>
    <div class="row-flex">

        <!-- LEFT: ORIGINAL PDF -->
        <iframe class="pdf-box" src="/PDF/sample.pdf"></iframe>

        <!-- RIGHT: TRANSLATED PDF -->
        <iframe class="pdf-box1" id="iframeTranslated"></iframe>

    </div>

</asp:Content>
