<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="TransPDF.aspx.cs" Inherits="Vidyakendraa.TransPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .pdf-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .pdf-frame {
            width: 100%;
            height: 250px;
            border: 1px solid #ccc;
            margin-top: 8px;
        }

        .title {
            font-weight: bold;
            text-align: center;
            margin-bottom: 5px;
        }
    </style>

    <div class="container mt-4">
        <h3 class="text-center mb-3">Multiple PDF Translator</h3>

        <!-- 🌍 Language -->
        <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control w-25 d-inline">
            <asp:ListItem Text="Select Language" Value="" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Hindi" Value="hi"></asp:ListItem>
            <asp:ListItem Text="English" Value="en"></asp:ListItem>
            <asp:ListItem Text="Tamil" Value="ta"></asp:ListItem>
            <asp:ListItem Text="Bengali" Value="bn"></asp:ListItem>
            <asp:ListItem Text="Gujarati" Value="gu"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnTranslateAll" runat="server" Text="Translate All"
            CssClass="btn btn-success ms-2" OnClick="btnTranslateAll_Click" />
        <br />
        <br />

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
        <!-- 📄 MULTIPLE PDF GRID -->
        <div class="row">
            <asp:Repeater ID="rptPDF" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="pdf-card">
                            <div class="title"><%# Eval("FileName") %></div>
                            <!-- ORIGINAL -->
                            <div class="title text-primary">Original</div>
                            <iframe src='<%# Eval("OriginalPath") %>' class="pdf-frame"></iframe>
                            <!-- TRANSLATED -->
                            <div class="title text-success">Translated</div>
                            <iframe src='<%# Eval("TranslatedPath") %>' class="pdf-frame"></iframe>
                            <!-- DOWNLOAD -->
                            <a href='<%# Eval("TranslatedPath") %>'
                                download='<%# Eval("FileName") %>_Translated.pdf'
                                class="btn btn-sm btn-success mt-2 w-100'">⬇ Download
                        </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
