<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="Resultado.aspx.cs" Inherits="simulador_seguros_nv4.Resultado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Resultado do Cálculo de Seguro</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 700;
        }

        h1 {
            font-size: 2.5em;
            margin-top: 30px;
        }

        h2 {
            font-size: 1.5em;
            color: #34495e;
        }

        .result_container {
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px #34495e;
        }

        .table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        .table_border {
            border: 1px solid #ddd;
        }

        .table th, .table td {
            padding: 8px;
            text-align: left;
        }

        .btn-submit {
            display: inline-block;
            width: 20%;
            padding: 12px;
            background-color: #00ff90;
            color: #000;
            font-size: 1.2em;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #27ae60;
    
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Resultado do Cálculo de Seguro</h1>

    <div class="result_container">

        <h2>Dados do usuário</h2>
        <table class="table table_border">
            <tr>
                <th>Nome:</th>
                <td><asp:Label ID="LabelNome" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <th>Data de Nascimento:</th>
                <td><asp:Label ID="LabelNascimento" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <th>CPF:</th>
                <td><asp:Label ID="LabelCpf" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <th>Valor total do seguro:</th>
                <td><asp:Label ID="LabelValorSeguro" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>

        <div class="button_back">
             <asp:Button ID="BotaoVoltar" runat="server" CssClass="btn-submit" Text="Voltar" OnClick="botaoVoltarHome" role="button" />
            <div class="form-group">
        </div>
        
    </div>
    
</asp:Content>
