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
    public class PerfilActivity:Activity
    {
        private TextView usernameTextView, emailTextView, nomeCompletoTextView;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.PerfilUsuario);

            usernameTextView = FindViewById<TextView>(Resource.Id.usernameTextView);
            emailTextView = FindViewById<TextView>(Resource.Id.emailTextView);
            nomeCompletoTextView = FindViewById<TextView>(Resource.Id.nomeCompletoTextView);

            Usuario usuario = UsuarioHelpers.ObterUsuarioLogado();

            string username = usuario.Username;
            string email = usuario.Email;
            string nomeCompleto = usuario.NomeCompleto;

            usernameTextView.Text = username;
            emailTextView.Text = email;
            nomeCompletoTextView.Text = nomeCompleto;
        }
    }
}