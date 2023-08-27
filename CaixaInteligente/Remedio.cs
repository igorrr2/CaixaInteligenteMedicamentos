﻿using Android.App;
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

namespace CaixaInteligente
{
    public class Remedio
    {
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }
        public string IdUsuario { get; set; }

        public string NomeRemedio { get; set; }

        public string Descricao { get; set; }

        public DateTime DataHoraCadastro { get; set; }

        public string HorarioInicio { get; set; }

        public int Frequencia { get; set; }

        public int Recipiente { get; set; }

        public static implicit operator Java.Lang.Object(Remedio v)
        {
            throw new NotImplementedException();
        }

    }
}