using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.SE.Omapi;
using Android.Views;
using Android.Widget;
using CaixaInteligente.Models;
using CaixaInteligente.Services;
using Firebase.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace CaixaInteligente
{
    [Activity(Label = "Alterar Senha")]
    internal class AlterarSenhaActivity : Activity
    {
        EditText editTextSenhaAntiga, editTextNovaSenha1, editTextNovaSenha2;
        Button buttonAlterarSenha;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.AlterarSenha);

            // Inicialização das Views
            editTextSenhaAntiga = FindViewById<EditText>(Resource.Id.editTextSenhaAntiga);
            editTextNovaSenha1 = FindViewById<EditText>(Resource.Id.editTextNovaSenha1);
            editTextNovaSenha2 = FindViewById<EditText>(Resource.Id.editTextNovaSenha2);
            buttonAlterarSenha = FindViewById<Button>(Resource.Id.buttonAlterarSenha);

            buttonAlterarSenha.Click += ButtonAlterarSenha_Click;
        }
        private void ButtonAlterarSenha_Click(object sender, EventArgs e)
        {
            ButtonAlterarSenha_ClickAsync(sender, e).Wait(); // Esperar a tarefa ser concluída de forma síncrona
        }
        private async Task ButtonAlterarSenha_ClickAsync(object sender, System.EventArgs e)
        {
            string senhaAntiga = editTextSenhaAntiga.Text;
            string novaSenha1 = editTextNovaSenha1.Text; 
            string novaSenha2 = editTextNovaSenha2.Text;
            if(senhaAntiga == "" || novaSenha1 == "" || novaSenha2 == "")
            {
                Toast.MakeText(this, "Preencha todos os campos corretamente", ToastLength.Short).Show();
            }

            else if (novaSenha1.Equals(novaSenha2))
            {
                Usuario usuario = UsuarioHelpers.ObterUsuarioLogado();
                bool senhaConfere = await ValidaSenhaUsuarioAsync(usuario.Username, senhaAntiga);
                if (senhaConfere)
                {
                    Toast.MakeText(this, "Deu", ToastLength.Short).Show();

                }
                else
                {
                    Toast.MakeText(this, "A senha digitada não confere com a cadastrada no sistema, por favor, tente novamente", ToastLength.Short).Show();
                }
            }
            else
            {
                // Senhas novas não coincidem, mostre uma mensagem de erro
                Toast.MakeText(this, "As novas senhas não coincidem. Por favor, insira as senhas novamente.", ToastLength.Short).Show();
            }
        }
        public async Task<bool> ValidaSenhaUsuarioAsync(string nome, string senha)
        {
            var userService = new UserService();
            bool result = await userService.LoginUser(nome, senha);

            return result;
            
        }
    }
}
