using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace simulador_seguros_nv4
{
    public partial class Resultado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Pega os dados da QueryString
                string nome = Request.QueryString["nome"];
                string dataNascimento = Request.QueryString["dataNascimento"];
                string cpf = Request.QueryString["cpf"];
                string tipoSeguro = Request.QueryString["tipoSeguro"];

                

                DateTime dataNasc = DateTime.Parse(dataNascimento);
                int idade = DateTime.Now.Year - dataNasc.Year;
                if (dataNasc > DateTime.Now.AddYears(-idade)) idade--;

                decimal valorSeguro = CalculandoValorSeguro(idade, tipoSeguro);

                // Exibe as informações na tela
                LabelNome.Text = $"Nome: {nome}";
                LabelNascimento.Text = $"Data de Nascimento: {dataNasc.ToString("dd/MM/yyyy")}";
                LabelCpf.Text = $"CPF: {cpf}"; // Aqui cpf já está inicializado
                LabelValorSeguro.Text = $"Total do valor do seguro: R$ {valorSeguro:F2}";
            }
        }

        // Método para calcular o valor do seguro
        protected decimal CalculandoValorSeguro(int idade, string tipoSeguro)
        {
            decimal valorReferencia = 1000m; //Valor de referência em decimal

            switch (tipoSeguro)
            {
                case "Seguro de vida":
                    valorReferencia *= 0.8m;
                    break;
                case "Seguro de morte acidental":
                    valorReferencia *= 0.9m;
                    break;
                case "Seguro contra acidentes pessoais":
                    valorReferencia *= 0.5m;
                    break;
                case "Seguro de saúde":
                    valorReferencia *= 0.4m;
                    break;
                case "Seguro de automóvel":
                    valorReferencia *= 2.5m;
                    break;
                case "Seguro residencial":
                    valorReferencia *= 0.6m;
                    break;
                case "Seguro patrimonial":
                    valorReferencia *= 1.2m;
                    break;
                case "Seguro empresarial":
                    valorReferencia *= 1.5m;
                    break;
                default:
                    break;
            }

            return valorReferencia;
        }

        protected void botaoVoltarHome(object sender, EventArgs e)
        {
            Response.Redirect("Formulario.aspx");
        }
    }
}

