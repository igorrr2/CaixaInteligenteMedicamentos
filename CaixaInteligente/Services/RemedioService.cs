using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using CaixaInteligente.Models;
using Firebase.Database;
using Firebase.Database.Query;
using Java.Util;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Java.Util.Jar.Attributes;

namespace CaixaInteligente.Services
{
    internal class RemedioService
    {
        FirebaseClient client;
        public RemedioService()
        {
            client = new FirebaseClient("https://caixainteligentedemedicamentos-default-rtdb.firebaseio.com/");
        }
        public async Task<bool> IsRemedioExists(string name)
        {
            var remedio = (await client.Child("Remedios").OnceAsync<Remedios>())
                .Where(u => u.Object.NomeRemedio == name)
                .FirstOrDefault();
            return (remedio != null);
        }
        public async Task<bool> RegisterRemedio(string idUsuario, string descricao, string nomeRemedio, string horarioDeInicio, int frequencia, int recipiente)
        {
            FirebaseObject<Remedios> result = await client.Child("Remedios")
                    .PostAsync(new Remedios()
                    {
                        IdUsuario = idUsuario,
                        Descricao = descricao,
                        NomeRemedio = nomeRemedio,
                        DataHoraCadastro = DateTime.Now,
                        HorarioInicio = horarioDeInicio,
                        Frequencia = frequencia,
                        Recipiente = recipiente
                    });
                
            return result !=null;
           
        }
        public async Task<List<Remedios>> ObterRemedios(string idUsuario)
        {
            try
            {
                var remediosFirebase = await client.Child("Remedios").OnceAsync<Remedios>();
                var remedios = remediosFirebase
                               .Where(u => u.Object.IdUsuario == idUsuario)
                               .Select(u => u.Object)
                               .ToList();
                return remedios;

            }
            catch (Exception ex)
            {
                string teste = ex.Message;
                return new List<Remedios>();
            }

        }
        public async Task<bool> RemoverRemedio(string nomeRemedio, string idUsuario)
        { 
            var remedios = (await client.Child("Remedios").OnceAsync<Remedios>())
                .Where(u => u.Object.NomeRemedio == nomeRemedio)
                .Where(u => u.Object.IdUsuario == idUsuario)
                .ToList();

            if (remedios == null)
            {
                return false;
            }
            foreach (var remedio in remedios)
            {
                try
                {
                    string idDoRmedio = remedio.Key;
                    var nodeRef = client.Child("Remedios").Child(idDoRmedio);

                    // Exclua o nó
                    await nodeRef.DeleteAsync();

                }
                catch (Exception ex)
                {
                    string teste = ex.Message;
                }
            }

            return true;
        }

    }
}