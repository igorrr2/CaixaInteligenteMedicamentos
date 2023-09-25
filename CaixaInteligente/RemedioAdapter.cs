using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using CaixaInteligente.Models;
using CaixaInteligente.Services;
using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Protocol;
using SQLite;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using static Android.Icu.Text.Transliterator;


namespace CaixaInteligente
{
    public class RemedioAdapter : BaseAdapter<Remedio>
    {
        private List<Remedio> remedios;
        private Context context;
        private EventHandler apagarClickHandler;
        private EventHandler EditarClickHandler;
        ComandosActivity _removerRemedioEsp;
        public RemedioAdapter(Context context, List<Remedio> remedios)
        {
            this.context = context;
            this.remedios = remedios;

            apagarClickHandler = (sender, args) =>
            {
                var button = (Button)sender;
                int position = (int)button.Tag;
                Remedio remedio = remedios[position];

                new AlertDialog.Builder(context)
                    .SetTitle("Apagar Remédio")
                    .SetMessage("Tem certeza que deseja apagar este remédio?")
                    .SetPositiveButton("Sim", async (dialog, args) =>
                    {

                        var remediosService = new RemedioService();
                        bool removido = await remediosService.RemoverRemedio(remedio.NomeRemedio, remedio.IdUsuario);

                        remedios.RemoveAt(position);
                        string caminhoBanco = System.IO.Path.Combine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal), "Remedio.db");
                        var db = new SQLiteConnection(caminhoBanco);
                        db.Delete<Remedio>(remedio.Id);
                        //Notifica o esp sobre o remédio apagado e envia o horário para remoção
                        //_removerRemedioEsp = new ComandosActivity();
                        //_removerRemedioEsp.RemoverRemedioEsp(remedio.Horario);
                        NotifyDataSetChanged();
                        Toast.MakeText(context, "Remédio apagado", ToastLength.Short).Show();
                    })
                    .SetNegativeButton("Não", (dialog, args) =>
                    {
                        ((AlertDialog)dialog).Dismiss();
                    })
                    .Create()
                    .Show();
            };
            EditarClickHandler = (sender, args) =>
            {
                var button = (Button)sender;
                int position = (int)button.Tag;
                Remedio remedio = remedios[position];
                int idRemedio = remedio.Id;

                Intent intent = new Intent(context, typeof(EditarRemedioActivity));
                intent.PutExtra("idRemedio", idRemedio);
                context.StartActivity(intent);
            };
        }


        public override int Count
        {
            get { return remedios.Count; }
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override Remedio this[int position]
        {
            get { return remedios[position]; }
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            View view = convertView;
            if (view == null)
            {
                LayoutInflater inflater = (LayoutInflater)context.GetSystemService(Context.LayoutInflaterService);
                view = inflater.Inflate(Resource.Layout.item_remedio, parent, false);
            }

            Remedio remedio = remedios[position];
            TextView textViewNome = view.FindViewById<TextView>(Resource.Id.text_view_nome);
            TextView textViewHorario = view.FindViewById<TextView>(Resource.Id.text_view_horario);
            TextView textFrequencia = view.FindViewById<TextView>(Resource.Id.text_frequencia);
            TextView textRecipiente = view.FindViewById<TextView>(Resource.Id.text_recipiente);
            Button buttonApagar = view.FindViewById<Button>(Resource.Id.button_apagar);
            Button buttonEditar = view.FindViewById<Button>(Resource.Id.button_editar);
            textViewNome.Text = remedio.NomeRemedio;
            textViewHorario.Text = "Horário de início: " + remedio.HorarioInicio;
            textFrequencia.Text = "Frequência: " + remedio.Frequencia + "h";
            textRecipiente.Text = "Recipiente: " + remedio.Recipiente;

            // Remove o manipulador de clique atual do botão "Apagar" antes de adicionar o novo manipulador
            buttonApagar.Click -= apagarClickHandler;

            // Adiciona o manipulador de clique do botão "Apagar" com a variável de evento global
            buttonApagar.Click += apagarClickHandler;

            // Remove o manipulador de clique atual do botão "Apagar" antes de adicionar o novo manipulador
            buttonEditar.Click -= EditarClickHandler;

            // Adiciona o manipulador de clique do botão "Apagar" com a variável de evento global
            buttonEditar.Click += EditarClickHandler;

            // Define a posição do item na Tag do botão "Apagar"
            buttonApagar.Tag = position;
            buttonEditar.Tag = position;
            return view;
        }
        public static void RemoverTodosRemediosSqlite()
        {
            string caminhoBanco = System.IO.Path.Combine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal), "Remedio.db");
            var db = new SQLiteConnection(caminhoBanco);
            db.Execute("DELETE FROM Remedio");
            db.Execute("DROP TABLE IF EXISTS Remedio");
            db.CreateTable<Remedio>();
        }
    }
}