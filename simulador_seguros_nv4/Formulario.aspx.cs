using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using simulador_seguros_nv4;

namespace simulador_seguros_nv4
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Enviar_dados(object sender, EventArgs e)
        {
            if (Page.IsValid) // Certifica que a página passou por todas as validações
            {
                string nome = Nome.Text;
                string dataNascimento = Data_nascimento.Text;
                string cpf = txtCpf.Text;
                string tipoSeguro = DropDownList1.SelectedValue;

                // Redireciona para a página de resultados com os dados do usuário
                Response.Redirect($"Resultado.aspx?nome={nome}&dataNascimento={dataNascimento}&cpf={cpf}&tipoSeguro={tipoSeguro}");
            }
        }

        // Método para validar a idade mínima
        protected void ValidarIdadeMinima(object source, ServerValidateEventArgs args)
        {
            DateTime dataNascimento;

            // Tenta converter o valor do campo para DateTime
            if (DateTime.TryParse(args.Value, out dataNascimento))
            {
                // Calcula a idade
                int idade = DateTime.Now.Year - dataNascimento.Year;
                // Ajusta se a data de nascimento ainda não ocorreu este ano
                if (dataNascimento > DateTime.Now.AddYears(-idade))
                {
                    idade--;
                }

                // Verifica se a idade é maior ou igual a 18
                args.IsValid = idade >= 18;
            }
            else
            {
                // Se a data for inválida, a validação falha
                args.IsValid = false;
            }
        }
    }
}