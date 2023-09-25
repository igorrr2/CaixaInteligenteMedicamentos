using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using CaixaInteligente.Services;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace CaixaInteligente
{
    [Activity(Label = "EditarRemedioActivity")]
    public class EditarRemedioActivity : Activity
    {
        private EditText editTextNomeRemedio;
        private EditText editTextHorarioInicio;
        private EditText editTextFrequencia;
        private EditText editTextRecipiente;
        private Button buttonSalvar;
        private SQLiteConnection db;
        private Remedio listaRemedios = new Remedio();
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.EditarRemedio);

            // Inicialize as variáveis EditText
            editTextNomeRemedio = FindViewById<EditText>(Resource.Id.editTextNomeRemedio);
            editTextHorarioInicio = FindViewById<EditText>(Resource.Id.editTextHorarioInicio);
            editTextFrequencia = FindViewById<EditText>(Resource.Id.editTextFrequencia);
            editTextRecipiente = FindViewById<EditText>(Resource.Id.editTextRecipiente);
            buttonSalvar = FindViewById<Button>(Resource.Id.buttonSalvar);

            buttonSalvar.Click += ButtonSalvar_ClickAsync;

            string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            string nomeDB = "Remedio.db";
            string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
            db = new SQLiteConnection(caminhoCompletoDB);
            int idRemedio = Intent.GetIntExtra("idRemedio", -1);
            listaRemedios = db.Table<Remedio>().Where(r => r.Id == idRemedio).SingleOrDefault(); ;

            // Aqui você pode receber os dados do remédio do Firebase
            string nomeRemedio = listaRemedios.NomeRemedio; // Substitua pelo valor do Firebase
            string horarioInicio = listaRemedios.HorarioInicio; // Substitua pelo valor do Firebase
            int frequencia = listaRemedios.Frequencia; // Substitua pelo valor do Firebase
            int recipiente = listaRemedios.Recipiente; // Substitua pelo valor do Firebase

            // Preencha os campos com os dados do Firebase
            editTextNomeRemedio.Text = nomeRemedio;
            editTextHorarioInicio.Text = horarioInicio;
            editTextFrequencia.Text = frequencia.ToString();
            editTextRecipiente.Text = recipiente.ToString();
        }

        private void ButtonSalvar_ClickAsync(object sender, System.EventArgs e)
        {

            string novoNomeRemedio = editTextNomeRemedio.Text;
            string novoHorarioInicio = editTextHorarioInicio.Text;
            int novaFrequencia = int.Parse(editTextFrequencia.Text);
            int novoRecipiente = int.Parse(editTextRecipiente.Text);

            var remediosService = new RemedioService();
            remediosService.UpdateRemedio(listaRemedios.NomeRemedio, listaRemedios.IdUsuario, novoHorarioInicio, novoNomeRemedio, novaFrequencia, novoRecipiente);
            Toast.MakeText(this, "Remédio Editado com sucesso", ToastLength.Short).Show();
        }
    }
}
