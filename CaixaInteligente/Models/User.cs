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

namespace CaixaInteligente.Models
{
    internal class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string NomeCompleto { get; set; }
        public DateTime DataHoraCadastro { get; set; }
        public string Id { get; set; }

    }
}