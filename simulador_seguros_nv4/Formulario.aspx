<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="simulador_seguros_nv4.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .form-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px #34495e;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            color: #2980b9;
            margin-bottom: 10px;
            font-size: 1.1em;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: #2980b9;
            background-color: #fff;
            outline: none;
            box-shadow: 0 0 6px #34495e);
        }

        .form-group input::placeholder {
            color: #aaa;
        }

        .error-message {
            color: #e74c3c;
            font-size: 0.9em;
            margin-top: 5px;
        }

        .btn-submit {
            display: inline-block;
            width: 100%;
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

        .form-container .table_border {
            border: 1px solid #ddd;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Formulário do Usuário</h1>
    <h2>Faça aqui o seu cadastro para simular o seguro desejado:</h2>

    <div class="form-container">
        <!-- Nome -->
        <div class="form-group">
            <asp:Label ID="Label_nome" runat="server" Text="Nome"></asp:Label>
            <asp:TextBox ID="Nome" runat="server" placeholder="Digite seu nome"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NomeValidator" runat="server" ControlToValidate="Nome"
                ErrorMessage="O nome é obrigatório." CssClass="error-message"></asp:RequiredFieldValidator>
        </div>

        <!-- Data de Nascimento -->
        <div class="form-group">
            <asp:Label ID="Label_data_nascimento" runat="server" Text="Data de Nascimento"></asp:Label>
            <asp:TextBox ID="Data_nascimento" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="DataNascimentoValidator" runat="server" ControlToValidate="Data_nascimento"
                ErrorMessage="Data de nascimento é obrigatória." CssClass="error-message"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidatorIdade" runat="server" ControlToValidate="Data_nascimento"
                ErrorMessage="Você precisa ter pelo menos 18 anos." CssClass="error-message"
                OnServerValidate="ValidarIdadeMinima"></asp:CustomValidator>
        </div>

        <!-- CPF -->
        <div class="form-group">
            <asp:Label ID="Label_cpf" runat="server" Text="CPF"></asp:Label>
            <asp:TextBox ID="txtCpf" runat="server" placeholder="000.000.000-00"></asp:TextBox>
            <asp:RequiredFieldValidator ID="CPFValidator" runat="server" ControlToValidate="txtCpf"
                ErrorMessage="O CPF é obrigatório." CssClass="error-message"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegexValidatorCPF" runat="server" ControlToValidate="txtCpf"
                ErrorMessage="CPF inválido." CssClass="error-message"
                ValidationExpression="\d{3}\.\d{3}\.\d{3}-\d{2}"></asp:RegularExpressionValidator>
        </div>

        <!-- Tipos de Seguros -->
        <div class="form-group">
            <asp:Label ID="Label_lista_seguros" runat="server" Text="Tipos de Seguros:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="Selecione um seguro" Value="" />
                <asp:ListItem>Seguro de vida</asp:ListItem>
                <asp:ListItem>Seguro de morte acidental</asp:ListItem>
                <asp:ListItem>Seguro contra acidentes pessoais</asp:ListItem>
                <asp:ListItem>Seguro de saúde</asp:ListItem>
                <asp:ListItem>Seguro de automóvel</asp:ListItem>
                <asp:ListItem>Seguro residencial</asp:ListItem>
                <asp:ListItem>Seguro patrimonial</asp:ListItem>
                <asp:ListItem>Seguro empresarial</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="SeguroValidator" runat="server" ControlToValidate="DropDownList1"
                ErrorMessage="Selecione um tipo de seguro." CssClass="error-message"></asp:RequiredFieldValidator>
        </div>

        <!-- Botão de Envio -->
        <div class="form-group">
            <asp:Button ID="Botao_enviar_dados" runat="server" CssClass="btn-submit" Text="Enviar" OnClick="Enviar_dados" />
        </div>
    </div>
</asp:Content>
