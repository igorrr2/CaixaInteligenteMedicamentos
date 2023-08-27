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

namespace CaixaInteligente.Services
{
    internal class UserService
    {
        FirebaseClient client;
        public UserService()
        {
            client = new FirebaseClient("https://caixainteligentedemedicamentos-default-rtdb.firebaseio.com/");
        }
        public async Task<bool> IsUserExists(string name)
        {
            var user = (await client.Child("Users").OnceAsync<User>())
                .Where(u => u.Object.Username == name)
                .FirstOrDefault();
            return (user != null);
        }
        public async Task<bool> RegisterUser(string name, string password, string nomeCompleto, string email)
        {
            if (await IsUserExists(name) == false)
            {
                await client.Child("Users")
                    .PostAsync(new User()
                    {
                        Username = name,
                        Password = password,
                        NomeCompleto = nomeCompleto,
                        Email = email,
                        DataHoraCadastro = DateTime.Now,
                        Id = UUID.RandomUUID().ToString() + name
                    });
                return true;
            }
            else
            {
                return false;
            }
        }
        public async Task<bool> LoginUser(string name, string password)
        {
            var user = (await client.Child("Users").OnceAsync<User>())
                .Where(u => u.Object.Username == name)
                .Where(u => u.Object.Password == password)
                .FirstOrDefault();
            if (user != null)
            {
                UsuarioHelpers.ApagarUsuario();
                UsuarioHelpers.SalvarUsuario(user.Object);
            }
            return (user != null);
            
        }
        
    }
}