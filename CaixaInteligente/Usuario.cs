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
using SQLite;
using CaixaInteligente.Models;

namespace CaixaInteligente
{
    public class Usuario
    {
        [PrimaryKey]
        public string Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string NomeCompleto { get; set; }

        public static implicit operator Java.Lang.Object(Usuario v)
        {
            throw new NotImplementedException();
        }
    }
}