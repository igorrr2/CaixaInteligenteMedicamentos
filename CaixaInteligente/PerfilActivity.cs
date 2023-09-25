using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CaixaInteligente
{
    [Activity(Label = "Perfil do Usuário", Theme = "@style/AppTheme")]
    public class PerfilActivity : Activity
    {
        private TextView usernameTextView, emailTextView, nomeCompletoTextView;
        private EditText editTextUsername;
        private EditText editTextEmail;
        private EditText editTextNomeCompleto;
        private Button editButton;
        private Button alterarSenhaButton;

        private bool modoEdicao = false;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.PerfilUsuario);

            usernameTextView = FindViewById<TextView>(Resource.Id.usernameTextView);
            emailTextView = FindViewById<TextView>(Resource.Id.emailTextView);
            nomeCompletoTextView = FindViewById<TextView>(Resource.Id.nomeCompletoTextView);
            editButton = FindViewById<Button>(Resource.Id.editButton);
            alterarSenhaButton = FindViewById<Button>(Resource.Id.alterarSenha);
            
            editButton.Click += (sender, e) =>
            {
                var intent = new Intent(this, typeof(UserProfileEditActivity));
                StartActivity(intent);
            };
            alterarSenhaButton.Click += alterarSenhaButton_Click;
        }
        protected override void OnResume()
        {
            base.OnResume();

            SetarTexView();
        }
        public void SetarTexView()
        {
            Usuario usuario = UsuarioHelpers.ObterUsuarioLogado();

            string username = usuario.Username;
            string email = usuario.Email;
            string nomeCompleto = usuario.NomeCompleto;

            usernameTextView.Text = username;
            emailTextView.Text = email;
            nomeCompletoTextView.Text = nomeCompleto;

        }
        private void alterarSenhaButton_Click(object sender, EventArgs e)
        {
            Intent intent = new Intent(this, typeof(AlterarSenhaActivity));
            StartActivity(intent);
        }
        }
}