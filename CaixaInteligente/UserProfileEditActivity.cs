using Android.App;
using Android.Content;
using Android.OS;
using Android.Views;
using Android.Widget;
using CaixaInteligente.Models;
using CaixaInteligente.Services;
using SQLite;

namespace CaixaInteligente
{
    [Activity(Label = "Editar Perfil", Theme = "@style/AppTheme")]
    public class UserProfileEditActivity : Activity
    {
        private EditText editTextUsername;
        private EditText editTextEmail;
        private EditText editTextNomeCompleto;
        private Button buttonSalvar;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.PerfilUsuarioEdicao);

            editTextUsername = FindViewById<EditText>(Resource.Id.editTextUsername);
            editTextEmail = FindViewById<EditText>(Resource.Id.editTextEmail);
            editTextNomeCompleto = FindViewById<EditText>(Resource.Id.editTextNomeCompleto);
            buttonSalvar = FindViewById<Button>(Resource.Id.buttonSalvar);

            Usuario usuario = UsuarioHelpers.ObterUsuarioLogado();

            editTextUsername.Text = usuario.Username;
            editTextEmail.Text = usuario.Email;
            editTextNomeCompleto.Text = usuario.NomeCompleto;

            buttonSalvar.Click += (sender, e) =>
            {
                string username = editTextUsername.Text;
                string email = editTextEmail.Text;
                string NomeCompleto = editTextNomeCompleto.Text;

                var userService = new UserService();
                userService.UpdateUsuario(usuario.Id, username, email, NomeCompleto);

                User user = new User();
                user.Username = username;
                user.Email = email;
                user.NomeCompleto = NomeCompleto;
                UsuarioHelpers.AtualizarUsuario(usuario.Id, username, email, NomeCompleto);


                Toast.MakeText(this, "Usuário Editado com sucesso", ToastLength.Short).Show();
                Finish();
            };
        }
    }
}