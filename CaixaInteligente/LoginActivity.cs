using Android.App;
using Android.OS;
using Android.Widget;
using System.Collections.Generic;
using Android.Support.Design.Widget;
using AndroidX.AppCompat.App;
using AndroidX.Core.View;
using AndroidX.DrawerLayout.Widget;
using Google.Android.Material.Navigation;
using System;
using Android.Views;
using Android.Content;
using AndroidX.RecyclerView.Widget;
using Android.Runtime;
using SQLite;
using MQTTnet.Extensions.ManagedClient;
using MQTTnet.Client;
using MQTTnet;
using CaixaInteligente.Services;
using System.Threading.Tasks;
using CaixaInteligente.Models;

namespace CaixaInteligente
{
    [Activity(Label = "LoginActivity")]
    internal class LoginActivity : Activity
    {
        private ListView listViewRemedios;
        private List<Remedio> listaRemedios = new List<Remedio>();
        private RemedioAdapter remedioAdapter;
        private SQLiteConnection db;
        ProgressBar progressBar;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.login);

            Button btnPerfil = FindViewById<Button>(Resource.Id.button_profile);
            ImageButton SincronizarRemedios = FindViewById<ImageButton>(Resource.Id.button_SincronizarRemedios);
            Button btnComandos = FindViewById<Button>(Resource.Id.button_commands);
            Button btnAdicionarRemedio = FindViewById<Button>(Resource.Id.button_add_remedio);
            progressBar = FindViewById<ProgressBar>(Resource.Id.progressBar);

            // Define as ações dos botões
            btnPerfil.Click += BtnPerfil_Click;
            SincronizarRemedios.Click += BtnSincronizarRemedios_Click;
            btnComandos.Click += BtnComandos_Click;
            btnAdicionarRemedio.Click += BtnAdicionarRemedio_Click;

            // Cria o banco de dados e a tabela
            string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            string nomeDB = "Remedio.db";
            string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
            db = new SQLiteConnection(caminhoCompletoDB);
            db.CreateTable<Remedio>();
            listViewRemedios = FindViewById<ListView>(Resource.Id.list_remedios);

            if (listaRemedios == null)
            {
                listaRemedios = new List<Remedio>();
            }

            // Configurações do cliente MQTT

            var mqttClientOptions = new ManagedMqttClientOptionsBuilder()
            .WithAutoReconnectDelay(TimeSpan.FromSeconds(5))
            .WithClientOptions(new MqttClientOptionsBuilder()
            .WithClientId(Guid.NewGuid().ToString())
            .WithTcpServer("test.mosquitto.org", 1883)
            .Build())
            .Build();

            var mqttClient = new MqttFactory().CreateManagedMqttClient();
            var mqttManager = new MqttManager(mqttClient, new ComandosActivity());

            // connect to the MQTT broker
            mqttClient.StartAsync(mqttClientOptions);

            // subscribe to the desired topic
            var topic = "TOPICO_SUBSCRIBE_CAIXA_INTELIGENTE_ANDROID";
            mqttManager.SubscribeAsync(topic);
            SincronizarRemediosAsync();
        }

        protected override void OnResume()
        {
            base.OnResume();
            CarregarRemedios();
        }


        private void BtnPerfil_Click(object sender, System.EventArgs e)
        {
            Intent intent = new Intent(this, typeof(PerfilActivity));
            StartActivity(intent);
        }
        private void BtnSincronizarRemedios_Click(object sender, System.EventArgs e)
        {
            SincronizarRemediosAsync();
        }

        private void BtnComandos_Click(object sender, System.EventArgs e)
        {
            try
            {
                Intent intent = new Intent(this, typeof(ComandosActivity));
                StartActivity(intent);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void BtnAdicionarRemedio_Click(object sender, System.EventArgs e)
        {
            try
            {
                Intent intent = new Intent(this, typeof(AdicionarRemedioActivity));
                StartActivity(intent);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        private async Task CarregarRemediosBancoFirebaseAsync()
        {
            Usuario usuario = UsuarioHelpers.ObterUsuarioLogado();

            var remediosService = new RemedioService();
            List<Models.Remedios> remedios = await remediosService.ObterRemedios(usuario.Id);
            SalvarRemediosBancoSqlite(remedios);
            await Task.Delay(1000);
        }
        private void SalvarRemediosBancoSqlite(List<Models.Remedios> remedios)
        {
            string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            string nomeDB = "Remedio.db";
            string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
            db = new SQLiteConnection(caminhoCompletoDB);
            foreach (Models.Remedios remedio in remedios)
            {
                var remedioParaInserir = new Remedio() { IdUsuario = remedio.IdUsuario, HorarioInicio = remedio.HorarioInicio, Descricao = remedio.Descricao, NomeRemedio = remedio.NomeRemedio, Frequencia = remedio.Frequencia, Recipiente = remedio.Recipiente };
                db.Insert(remedioParaInserir);
            }
        }

        private void CarregarRemedios()
        {
            if (db == null)
            {
                return;
            }

            listaRemedios = db.Table<Remedio>().ToList();
            remedioAdapter = new RemedioAdapter(this, listaRemedios);
            listViewRemedios.Adapter = remedioAdapter;
        }
        private async Task SincronizarRemediosAsync()
        {
            ProgressDialog progressDialog = new ProgressDialog(this);
            progressDialog.SetTitle("Sincronizando");
            progressDialog.SetMessage("Carregando remédios...");
            progressDialog.SetCancelable(false); // Impede que o usuário cancele

            progressDialog.Show();
            RemedioAdapter.RemoverTodosRemediosSqlite();
            await CarregarRemediosBancoFirebaseAsync();
            CarregarRemedios();
            await Task.Delay(1000);
            progressDialog.Dismiss();


        }
    }

}